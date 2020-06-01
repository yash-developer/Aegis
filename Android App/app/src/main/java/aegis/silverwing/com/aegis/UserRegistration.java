package aegis.silverwing.com.aegis;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;
import org.ksoap2.serialization.PropertyInfo;

/**
 * Created by admin on 07-Jan-18.
 */

public class UserRegistration extends AppCompatActivity {

    ProgressDialog progressDialog;
    EditText etfname, etlname, etemail, etpassword, etmobile, etaadhar, etarea, etaddress;
    RadioGroup rbgender;
    Button btnRegister;
    TextView LoginLink;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);
        Intent intent = getIntent();
        etfname = (EditText)findViewById(R.id.etfname);
        etlname = (EditText)findViewById(R.id.etlname);
        etemail = (EditText)findViewById(R.id.etEmail);
        etpassword = (EditText)findViewById(R.id.etPassword);
        etmobile = (EditText)findViewById(R.id.etMobile);
        rbgender = (RadioGroup)findViewById(R.id.rggender);
        etaadhar = (EditText)findViewById(R.id.etaadhar);
        etarea = (EditText)findViewById(R.id.etarea);
        etaddress= (EditText)findViewById(R.id.etaddress);
        btnRegister=(Button)findViewById(R.id.btnRegister);
        LoginLink= (TextView) findViewById(R.id.login_link);


        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getApplicationContext(),"button clicked",Toast.LENGTH_LONG).show();

                int selectedId = rbgender.getCheckedRadioButtonId();
                RadioButton val=(RadioButton)findViewById(selectedId);


                new UserInsert().execute(
                        etaadhar.getText().toString().trim(),
                        etfname.getText().toString().trim(),
                        etlname.getText().toString().trim(),
                        val.getText().toString().trim(),
                        etemail.getText().toString().trim(),
                        etmobile.getText().toString().trim(),
                        etarea.getText().toString().trim(),
                        etaddress.getText().toString().trim(),
                        etpassword.getText().toString().trim());
            }
        });

        LoginLink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(UserRegistration.this, UserLogin.class);
                startActivity(intent);
            }
        });
    }

    private  class UserInsert extends AsyncTask<String,String,JSONObject> {

        @Override
        protected void onPreExecute() {
            progressDialog = new ProgressDialog(UserRegistration.this);
            progressDialog.setMessage("Please wait...");
            progressDialog.setCancelable(false);
            progressDialog.setCanceledOnTouchOutside(false);
            progressDialog.show();
            super.onPreExecute();
        }

        @Override
        protected JSONObject doInBackground(String... params) {

            PropertyInfo[] propertyInfos = new PropertyInfo[9];

            propertyInfos[0] = new PropertyInfo();
            propertyInfos[0].setName("aadhar_id");
            propertyInfos[0].setValue(params[0]);
            propertyInfos[0].setType(String.class);

            propertyInfos[1] = new PropertyInfo();
            propertyInfos[1].setName("first_name");
            propertyInfos[1].setValue(params[1]);
            propertyInfos[1].setType(String.class);

            propertyInfos[2] = new PropertyInfo();
            propertyInfos[2].setName("last_name");
            propertyInfos[2].setValue(params[2]);
            propertyInfos[2].setType(String.class);

            propertyInfos[3] = new PropertyInfo();
            propertyInfos[3].setName("gender");
            propertyInfos[3].setValue(params[3]);
            propertyInfos[3].setType(String.class);

            propertyInfos[4] = new PropertyInfo();
            propertyInfos[4].setName("email");
            propertyInfos[4].setValue(params[4]);
            propertyInfos[4].setType(String.class);

            propertyInfos[5] = new PropertyInfo();
            propertyInfos[5].setName("mobile_no");
            propertyInfos[5].setValue(params[5]);
            propertyInfos[5].setType(String.class);

            propertyInfos[6] = new PropertyInfo();
            propertyInfos[6].setName("area");
            propertyInfos[6].setValue(params[6]);
            propertyInfos[6].setType(String.class);

            propertyInfos[7] = new PropertyInfo();
            propertyInfos[7].setName("address");
            propertyInfos[7].setValue(params[7]);
            propertyInfos[7].setType(String.class);

            propertyInfos[8] = new PropertyInfo();
            propertyInfos[8].setName("password");
            propertyInfos[8].setValue(params[8]);
            propertyInfos[8].setType(String.class);



            WebserviceCall wc=new WebserviceCall();
            return  wc.MethodCall("InsertUser", propertyInfos);
        }

        @Override
        protected void onPostExecute(JSONObject jsonObject) {

            Log.d("TAG", jsonObject +"");
            if (jsonObject != null) {

                try {

                    if (jsonObject.getInt("status") == 1) {
                        Toast.makeText(getApplicationContext(), "Registration successful", Toast.LENGTH_SHORT).show();
                        Toast.makeText(getApplicationContext(), "Login to continue", Toast.LENGTH_LONG).show();

                        Intent intent = new Intent(UserRegistration.this, UserLogin.class);
                        startActivity(intent);
                        finish();
                    } else {
                        Toast.makeText(getApplicationContext(), "Registration failed. Please try again!!", Toast.LENGTH_LONG).show();
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
