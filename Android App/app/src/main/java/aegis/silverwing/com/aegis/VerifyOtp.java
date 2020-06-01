package aegis.silverwing.com.aegis;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;
import org.ksoap2.serialization.PropertyInfo;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by admin on 03-Mar-18.
 */

public class VerifyOtp extends AppCompatActivity {
    EditText etOtp;
    Button btnVerify;
    ProgressDialog progressDialog;
    String mobile;
    String otp;
    SessionManager session;
    private SmsVerifyCatcher smsVerifyCatcher;
    private static final String TAG = VerifyOtp.class.getSimpleName();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_verify_otp);
        Intent intent = getIntent();
        mobile = intent.getStringExtra("mobile");
        etOtp = (EditText) findViewById(R.id.etotp);
        btnVerify = (Button) findViewById(R.id.btnVerify);
        session = new SessionManager(getApplicationContext());

        //init SmsVerifyCatcher
        smsVerifyCatcher = new SmsVerifyCatcher(this, new OnSmsCatchListener<String>() {
            @Override
            public void onSmsCatch(String message) {
                String code = parseCode(message);//Parse verification code
                etOtp.setText(code);//set code in edit text
                //then you can send verification code to server
            }
        });

        //set phone number filter if needed
        smsVerifyCatcher.setPhoneNumberFilter("SMSBUZ");
        //smsVerifyCatcher.setFilter("regexp");




        btnVerify.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                new GetUser().execute(
                        mobile,
                        etOtp.getText().toString().trim());

/*
                Intent intent = new Intent(VerifyOtp.this, MainActivity.class);
                startActivity(intent);*/
            }
        });


    }

    /**
     * Parse verification code
     *
     * @param message sms message
     * @return only four numbers from massage string
     */
    private String parseCode(String message) {
        Pattern p = Pattern.compile("\\b\\d{6}\\b");
        Matcher m = p.matcher(message);
        String code = "";
        while (m.find()) {
            code = m.group(0);
        }
        return code;
    }

    @Override
    protected void onStart() {
        super.onStart();
        smsVerifyCatcher.onStart();
    }

    @Override
    protected void onStop() {
        super.onStop();
        smsVerifyCatcher.onStop();
    }

    /**
     * need for Android 6 real time permissions
     */
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        smsVerifyCatcher.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }

    private  class GetUser extends AsyncTask<String,String,JSONObject> {

        @Override
        protected void onPreExecute() {
            progressDialog = new ProgressDialog(VerifyOtp.this);
            progressDialog.setMessage("Please wait...");
            progressDialog.setCancelable(false);
            progressDialog.setCanceledOnTouchOutside(false);
            progressDialog.show();
            super.onPreExecute();
        }

        @Override
        protected JSONObject doInBackground(String... params) {

            PropertyInfo[] propertyInfos = new PropertyInfo[2];

            propertyInfos[0] = new PropertyInfo();
            propertyInfos[0].setName("mobile");
            propertyInfos[0].setValue(params[0]);
            propertyInfos[0].setType(String.class);

            propertyInfos[1] = new PropertyInfo();
            propertyInfos[1].setName("otp");
            propertyInfos[1].setValue(params[1]);
            propertyInfos[1].setType(String.class);


            WebserviceCall wc=new WebserviceCall();
            return  wc.MethodCall("VerifyOtp", propertyInfos);
        }

        @Override
        protected void onPostExecute(JSONObject jsonObject) {

            Log.d("TAG", jsonObject +"");
            if (jsonObject != null) {

                try {

                    Log.e("JsonObject is ========", jsonObject.toString());
                    if (jsonObject.has("Table")) {

                        JSONArray jsonArrayData = jsonObject.getJSONArray("Table");

                        Log.e(TAG, "Array Length" + jsonArrayData.length());

                            JSONObject dataObject = jsonArrayData.getJSONObject(0);

                            Log.i("USerObject", "++" + dataObject);

                            if(dataObject.has("user_id")) {

                                String StrUserId = dataObject.getString("user_id");
                                String StrFirstName = dataObject.getString("first_name");
                                String StrLastName = dataObject.getString("last_name");
                                String StrEmail = dataObject.getString("email");
                                String StrMobile = dataObject.getString("mobile_no");
                                String StrArea = dataObject.getString("area");

                                session.createLoginSession(StrUserId,StrFirstName,StrLastName,StrEmail,StrMobile,StrArea);
                        }

                        Toast.makeText(getApplicationContext(), "Verification Successfully.", Toast.LENGTH_SHORT).show();

                        Intent intent = new Intent(VerifyOtp.this, MainActivity.class);

                        startActivity(intent);
                        finish();
                    } else {
                        Toast.makeText(getApplicationContext(), "Verification failed. Please try again!!", Toast.LENGTH_LONG).show();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                Toast.makeText(getApplicationContext(), "Network error", Toast.LENGTH_LONG).show();
            }

            progressDialog.dismiss();
            super.onPostExecute(jsonObject);
        }
    }
}
