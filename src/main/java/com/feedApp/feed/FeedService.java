package com.feedApp.feed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
