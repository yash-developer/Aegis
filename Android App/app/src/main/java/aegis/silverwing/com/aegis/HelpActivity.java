package aegis.silverwing.com.aegis;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

/**
 * Created by admin on 09-Mar-18.
 */

public class HelpActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_help);
        Intent intent = getIntent();

        //Adding toolbar to the activity
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        // back button
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setTitle("Help");

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getApplicationContext(),MainActivity.class));
            }
        });
    }

    //
    // Implementing menu
    //


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    // What to do when a menu item is selected
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {

            // action with the aegis icon
            case android.R.id.home:
                Intent intent = new Intent(this, MainActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(intent);
                break;

            // action with ID action_faq was selected
            case R.id.action_faq:
                Toast.makeText(this, "FAQ selected", Toast.LENGTH_SHORT)
                        .show();
                Intent faq = new Intent(this, FaqActivity.class);
                startActivity(faq);
                break;

            // action with ID action_settings was selected
            case R.id.action_settings:
                Toast.makeText(this, "Settings selected", Toast.LENGTH_SHORT)
                        .show();
                Intent settings = new Intent(this, SettingsActivity.class);
                startActivity(settings);
                break;

            // action with ID action_contactus was selected
            case R.id.action_contactus:
                Toast.makeText(this, "Contact us selected", Toast.LENGTH_SHORT)
                        .show();
                break;

            // action with ID action_help was selected
            case R.id.action_help:
                Toast.makeText(this, "Help selected", Toast.LENGTH_SHORT)
                        .show();
                break;

            default:
                break;
        }

        return super.onOptionsItemSelected(item);
    }



}
