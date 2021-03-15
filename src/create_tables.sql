CREATE TABLE `region` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `state` (
  `id` int(10) unsigned NOT NULL,
  `id_region` int(10) unsigned NOT NULL,
  `initials` varchar(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  `area` double NOT NULL,
  `order_map` int(1) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_state_region_idx` (`id_region`),
  CONSTRAINT `fk_state_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `city` (
  `id` int(10) unsigned NOT NULL,
  `id_region` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `capital` varchar(1) NOT NULL,
  `order_map` int(1) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` int(11) NOT NULL,
  `area` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_region1_idx` (`id_region`),
  KEY `fk_city_state1_idx` (`id_state`),
  CONSTRAINT `fk_city_region1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_city_state1` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `boundary` (
  `id` int(10) unsigned NOT NULL,
  `id_region` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `shape` longtext NOT NULL,
  `geometry_type` varchar(16) NOT NULL,
  `geometry_shape` geometry DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_idx` (`id_region`),
  KEY `fk_id_state_idx` (`id_state`),
  KEY `fk_id_city_idx` (`id_city`),
  CONSTRAINT `fk_id_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_state` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;