package com.feedApp.feed;

import com.feedApp.item.Item;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

/**
 * Created by Ray on 04/02/2017.
 */
@Service
public class FeedService {

    private FeedRepository feedRepository;

    @Autowired
    public void setFeedRepository(FeedRepository feedRepository) {
        this.feedRepository = feedRepository;
    }

    public Iterable<Feed> listAllFeeds() {
        return feedRepository.findAll();
    }

    public Feed getFeedById(Integer id) {
        return feedRepository.findOne(id);
    }

    public Feed saveFeed(Feed feed) {
        return feedRepository.save(feed);
    }

    public void deleteFeed(Integer id) {
        feedRepository.delete(id);
    }

    public boolean fetchFeedItems(Feed feed) {
        String url = feed.getUrl();
        try {
            SyndFeed syndFeed = new SyndFeedInput().build(new XmlReader(new URL(url)));
            if (!syndFeed.getPublishedDate().equals(feed.getLastUpdate())) {
                feed.setLastUpdate(syndFeed.getPublishedDate());
                feed.setTitle(syndFeed.getTitle());
                List<SyndEntry> syndEntries = syndFeed.getEntries();
                for (Item feedItem :  feed.getItems()) {
                    Predicate<SyndEntry> itemPredicate = p-> p.getPublishedDate().equals(feedItem.getPublished());
                    syndEntries.removeIf(itemPredicate);
                }
                for (SyndEntry syndEntry : syndEntries) {
                    feed.getItems().add(new Item(syndEntry.getTitle(), syndEntry.getLink(), syndEntry.getPublishedDate()));
                }
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception while connecting to: "+ex.getMessage());
            return false;
        }
        return true;
    }
}
