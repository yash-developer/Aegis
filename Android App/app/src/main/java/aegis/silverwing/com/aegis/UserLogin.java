package aegis.silverwing.com.aegis;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;
import org.ksoap2.serialization.PropertyInfo;

import java.security.SecureRandom;

/**
 * Created by admin on 07-Jan-18.
 */

public class UserLogin extends AppCompatActivity {

    int range = 9;  // to generate a single number with this range, by default its 0..9
    int length = 6; // by default length is 6
    ProgressDialog progressDialog;
    EditText mobile;
    TextView RegisterLink;
    Button btnOtp;
    String otp_pin;
    SharedPreferences preference;
    SessionManager session;
    public static final String OTP = "OTP";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        Intent intent = getIntent();
        mobile = (EditText) findViewById(R.id.etlmobile);
        RegisterLink = (TextView) findViewById(R.id.Register_link);
        btnOtp = (Button) findViewById(R.id.btnOtp);

        session = new SessionManager(getApplicationContext());
        session.ifLogin();

        btnOtp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(UserLogin.this, "Getting OTP", Toast.LENGTH_LONG).show();
                otp_pin = generateRandomNumber();
                Log.e("OTP_PIN =",String.valueOf(otp_pin));

                new UserLogin.SendOtp().execute(
                        mobile.getText().toString().trim(),
                        otp_pin);

                /*Intent intent = new Intent(UserLogin.this, VerifyOtp.class);
                startActivity(intent);*/

            }
        });

        RegisterLink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(UserLogin.this, UserRegistration.class);
                startActivity(intent);
            }
        });

    }

    private  class SendOtp extends AsyncTask<String,String,JSONObject> {

        @Override
        protected void onPreExecute() {
            progressDialog = new ProgressDialog(UserLogin.this);
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
            return  wc.MethodCall("InsertOtp", propertyInfos);
        }

        @Override
        protected void onPostExecute(JSONObject jsonObject) {

            Log.d("TAG", jsonObject +"");
            if (jsonObject != null) {

                try {

                    if (jsonObject.getInt("status") == 1) {
                        Toast.makeText(getApplicationContext(), "OTP Sent Successfully.", Toast.LENGTH_SHORT).show();
                        Toast.makeText(getApplicationContext(), "Verify OTP to Continue", Toast.LENGTH_LONG).show();

                        Intent intent = new Intent(UserLogin.this, VerifyOtp.class);
                        intent.putExtra("mobile", mobile.getText().toString().trim());
                        intent.putExtra("otp",otp_pin);


                        startActivity(intent);
                        finish();
                    } else {
                        Toast.makeText(getApplicationContext(), "Sending OTP failed. Please try again!!", Toast.LENGTH_LONG).show();
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

    public String generateRandomNumber() {
        int randomNumber;

        SecureRandom secureRandom = new SecureRandom();
        String s = "";
        for (int i = 0; i < length; i++) {
            int number = secureRandom.nextInt(range);
            if (number == 0 && i == 0) {
                // to prevent the Zero to be the first number as then it will reduce the length of generated pin to three or even more if the second or third number came as zeros
                i = -1;
                continue;
            }
            s = s + number;
        }

        /*randomNumber = Integer.parseInt(s);*/

        return s;
    }


}
