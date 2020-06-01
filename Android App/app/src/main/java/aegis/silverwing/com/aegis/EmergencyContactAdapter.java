package aegis.silverwing.com.aegis;

import android.content.Context;
import android.support.v4.app.FragmentActivity;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

/**
 * Created by admin on 18-Mar-18.
 */

public class EmergencyContactAdapter extends RecyclerView.Adapter<EmergencyContactAdapter.MyViewHolder> {
    private Context mContext;
    private List<EmergencyContact> contactList;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView station, area, contact;

        public MyViewHolder(View view) {
            super(view);
            station = (TextView) view.findViewById(R.id.station_name);
            area = (TextView) view.findViewById(R.id.area);
            contact = (TextView) view.findViewById(R.id.contact);

        }

    }

    public EmergencyContactAdapter(FragmentActivity activity, List<EmergencyContact> contactList) {
        this.contactList = contactList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.emergencycontact_card, parent, false);

        return new EmergencyContactAdapter.MyViewHolder(itemView);

    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        EmergencyContact emergencyContact = contactList.get(position);
        holder.station.setText(emergencyContact.getStation());
        holder.area.setText(emergencyContact.getArea());
        holder.contact.setText(emergencyContact.getContact());

    }

    @Override
    public int getItemCount() {
        return contactList.size();
    }

}
