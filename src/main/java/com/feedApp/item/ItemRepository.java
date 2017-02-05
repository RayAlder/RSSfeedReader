package com.feedApp.item;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Ray on 04/02/2017.
 */
@Transactional
public interface ItemRepository extends CrudRepository<Item, Integer> {
}
