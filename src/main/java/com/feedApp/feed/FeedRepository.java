package com.feedApp.feed;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Ray on 04/02/2017.
 */
@Transactional
public interface FeedRepository extends CrudRepository<Feed, Integer> {
}
