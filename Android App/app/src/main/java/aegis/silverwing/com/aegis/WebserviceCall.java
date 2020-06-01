package aegis.silverwing.com.aegis;

import android.util.Log;

import org.json.JSONObject;
import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.AndroidHttpTransport;


/**
 * @author AndroidExample DotNetWebService Class
 */
public class WebserviceCall {

    /**
     * Variable Decleration................
     */
    String namespace = "http://tempuri.org/";
    private String url = "http://yashyadav123-001-site1.atempurl.com/WebService.asmx";
    String SOAP_ACTION;
    SoapObject request = null, objMessages = null;
    SoapSerializationEnvelope envelope;
    AndroidHttpTransport androidHttpTransport;
    JSONObject jObj = null;

    public WebserviceCall() {
    }

    /**
     * Set Envelope
     */
    protected void SetEnvelope() {

        try {

            // Creating SOAP envelope
            envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);

            //You can comment that line if your web service is not .NET one.
            envelope.dotNet = true;

            envelope.setOutputSoapObject(request);
            androidHttpTransport = new AndroidHttpTransport(url);
            androidHttpTransport.debug = true;

        } catch (Exception e) {
            System.out.println("Soap Exception---->>>" + e.toString());
        }
    }

    // MethodName variable is define for which webservice function  will call
    public JSONObject MethodCall(String MethodName, PropertyInfo[] propertyInfo ) {

        try {
            SOAP_ACTION = namespace + MethodName;

            //Adding values to request object
            request = new SoapObject(namespace, MethodName);

            if (propertyInfo != null) {
                for (PropertyInfo aPropertyInfo : propertyInfo)
                    request.addProperty(aPropertyInfo);
            }



            SetEnvelope();

            //SOAP calling webservice
            androidHttpTransport.call(SOAP_ACTION, envelope);

            //Got Webservice response
            String result = envelope.getResponse().toString();
            Log.d("Result Is", result);
            jObj = new JSONObject(result);
            return jObj;


        } catch (Exception e) {
            // TODO: handle exception
//            return e.toString();
            e.printStackTrace();
        }
        return jObj;

    }


    /************************************/
}
