package CEFTokenManager.services.southAfrica.priv;

// -----( IS Java Code Template v1.2

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.math.BigInteger;
import java.security.MessageDigest;
import java.time.Instant;
import java.util.Base64;
import java.util.Random;
// --- <<IS-END-IMPORTS>> ---

public final class Java

{
	// ---( internal utility methods )---

	final static Java _instance = new Java();

	static Java _newInstance() { return new Java(); }

	static Java _cast(Object o) { return (Java)o; }

	// ---( server methods )---




	public static final void getSecretDigest (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getSecretDigest)>> ---
		// @sigtype java 3.5
		// [i] field:0:required sharedSecret
		// [o] field:0:required secretDigest
		// [o] field:0:required nonce
		// [o] field:0:required timestamp
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		//	String	nonce = IDataUtil.getString( pipelineCursor, "nonce" );
		//	String	timestamp = IDataUtil.getString( pipelineCursor, "timestamp" );
			String	sharedSecret = IDataUtil.getString( pipelineCursor, "sharedSecret" );
		pipelineCursor.destroy();
		
		String nonce=getNonce();
		String timestamp=getTimeInEpoch();
		
		String baseString = nonce + timestamp + sharedSecret;
		String secretDigest=null;
		
		 try { 
		       
		  
		
		
		
			  // getInstance() method is called with algorithm SHA-1 
					        MessageDigest md = MessageDigest.getInstance("SHA-1"); 
					  
					       
					        byte[] messageDigest = md.digest(baseString.getBytes("UTF-8")); 
					  
					        
					        secretDigest= Base64.getEncoder().encodeToString(messageDigest);
					        
		 }
		  
		    // For specifying wrong message digest algorithms 
		    catch (Exception e) { 
		        throw new RuntimeException(e); 
		    } 
		
		
		
		
		// pipeline
		IDataCursor pipelineCursor_1 = pipeline.getCursor();
		IDataUtil.put( pipelineCursor_1, "timestamp", timestamp);
		IDataUtil.put( pipelineCursor_1, "secretDigest", secretDigest);
		IDataUtil.put( pipelineCursor_1, "nonce", nonce);
		pipelineCursor_1.destroy();
			
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
	private static String getTimeInEpoch() {
		long currentTimestamp = Instant.now().toEpochMilli();
		return String.valueOf(currentTimestamp);
	}
	
	public static String getNonce(){
		 int leftLimit = 48; // numeral '0'
		    int rightLimit = 122; // letter 'z'
		    int targetStringLength = 10;
		    Random random = new Random();
		
		    String generatedString = random.ints(leftLimit, rightLimit + 1)
		      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
		      .limit(targetStringLength)
		      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
		      .toString();
		
		
		return generatedString;
		
		
	}
	// --- <<IS-END-SHARED>> ---
}

