CREATE TABLE users (
  uid SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE,
  email VARCHAR(255),
  email_verified BOOLEAN,
  date_created DATE,
  last_login DATE
);

CREATE TABLE resources (
  rid SERIAL PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  exerpt VARCHAR(255),
  body VARCHAR,
  resolved_url VARCHAR(255),
  search_vector TSVECTOR,
  user_id INT REFERENCES users(uid),
  resource_author VARCHAR REFERENCES users(username),
  resource_type VARCHAR(255),
  like_user_id INT[] DEFAULT ARRAY[]::INT[],
  likes INT DEFAULT 0,
  date_published DATE,
  date_created TIMESTAMP
);

CREATE TABLE comments (
  cid SERIAL PRIMARY KEY,
  comment VARCHAR(255),
  author VARCHAR REFERENCES users(username),
  user_id INT REFERENCES users(uid),
  resource_id INT REFERENCES resources(rid),
  date_created TIMESTAMP
);