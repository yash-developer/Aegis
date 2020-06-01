package aegis.silverwing.com.aegis;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;

/**
 * Created by admin on 10-Feb-18.
 */

public class splashscreen extends AppCompatActivity {
    private static int splash_timeout = 5000;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splashscreen);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent intent= new Intent(splashscreen.this,UserLogin.class);
                startActivity(intent);
                finish();

            }
        },splash_timeout);
    }
}
