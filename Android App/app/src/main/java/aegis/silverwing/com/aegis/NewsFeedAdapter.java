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
 * Created by admin on 10-Mar-18.
 */

public class NewsFeedAdapter extends RecyclerView.Adapter<NewsFeedAdapter.MyViewHolder> {
    private Context mContext;
    private List<NewsFeed> newsfeedList;

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView title, description;

        public MyViewHolder(View view) {
            super(view);
            title = (TextView) view.findViewById(R.id.title);
            description = (TextView) view.findViewById(R.id.description);
        }

    }

    public NewsFeedAdapter(FragmentActivity activity, List<NewsFeed> newsfeedList) {
        this.newsfeedList = newsfeedList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.newsfeed_card, parent, false);

        return new NewsFeedAdapter.MyViewHolder(itemView);

    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {
        NewsFeed newsfeed = newsfeedList.get(position);
        holder.title.setText(newsfeed.getTitle());
        holder.description.setText(newsfeed.getDescription());
    }

    @Override
    public int getItemCount() {
        return newsfeedList.size();
    }




}
