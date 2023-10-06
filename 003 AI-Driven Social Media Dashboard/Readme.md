# AWS guidance project:  Build a social media dashboard using artificial intelligence and business intelligence services.

Deployed with Terraform withe the original project. 

## Project description: (from AWS)

Voice of customer analytics through social media: Build a social media dashboard using artificial intelligence and business intelligence services.

Organizations want to understand how customers perceive them and who those customers are. For example, what factors are driving the most positive and negative experiences for their offerings? Social media interactions between organizations and customers are a great way to evaluate this and deepen brand awareness. Understanding these conversations are a low-cost way to acquire leads, improve website traffic, develop customer relationships, and improve customer service. Since these conversations are all in unstructured text format, it is difficult to scale the analysis and get the full picture.

## System High-level Design. 

![image](https://github.com/dada325/AWS-GCP-Cloud-System/assets/7775973/facbf150-a17b-4721-aeb9-3ab90a1876ec)


1. **Tweet Ingestion**:
   - An EC2 instance is set up to continuously fetch tweets from Twitter. This could be done using a script or application running on the EC2 instance that uses the Twitter API to ingest tweets in real-time or in batches.
   
2. **Initial Data Streaming**:
   - As tweets are ingested by the EC2 instance, they are immediately sent to a Kinesis Data Firehose delivery stream. Kinesis Data Firehose is designed to capture, transform, and load streaming data into other AWS services, in this case, an S3 bucket.
   
3. **Storing Raw Tweets**:
   - The Kinesis Data Firehose delivery stream loads these raw tweets into the `raw` prefix of an S3 bucket. This S3 bucket acts as the primary storage for all raw and processed data.
   
4. **Processing with Lambda**:
   - Once a raw tweet lands in the S3 bucket, an event trigger invokes a Lambda function. This function has two main tasks:
     - If the tweet is not in English, it uses Amazon Translate to translate the tweet into English.
     - It then uses Amazon Comprehend for NLP tasks: entity extraction and sentiment analysis on the (possibly translated) tweet.

5. **Storing Processed Data**:
   - The Lambda function sends the translated tweets and sentiment values to a second Kinesis Data Firehose delivery stream, which then loads this data into the `sentiment` prefix in the S3 bucket.
   - Similarly, the extracted entities are sent to a third Kinesis Data Firehose delivery stream, which loads this data into the `entities` prefix of the S3 bucket.
   
6. **Data Lake Creation & Analysis**:
   - AWS Glue crawlers scan the data stored in the S3 bucket and automatically create table definitions in the Glue Data Catalog. This process effectively turns your S3 bucket into a queryable data lake.
   - Amazon Athena can then be used to run SQL-like queries on this data directly in S3, using the table definitions created by Glue.
   
7. **Visualization**:
   - Amazon QuickSight is set up to visualize the analyzed data. It can pull the query results from Athena and display them in interactive dashboards. This allows stakeholders to gain insights into the sentiments and entities extracted from the tweets.

In essence, tweets flow from ingestion on EC2, through real-time processing streams (Kinesis and Lambda), get stored and categorized on S3, are organized into a queryable format with Glue and Athena, and are finally visualized in QuickSight. 

This architecture provides a scalable, serverless pipeline for real-time data processing and analysis.
