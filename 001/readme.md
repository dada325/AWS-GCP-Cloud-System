Real-Time Web Analytics.

![image](https://github.com/dada325/AWS-GCP-Cloud-System/assets/7775973/778e80b4-c943-47b7-9569-f66d4b778f7e)

# Features
## Real-time visualizations
Real-Time Web Analytics with Kinesis Data Analytics enables you to track website activity in real-time. Visualize web usage metrics including events per hour, visitor count, user agents, abnormal events, aggregate event count, referrers, and recent events. Customize this Guidance to include additional metrics.
## Real-time dashboard
Automatically deploy a real-time dashboard that displays web usage metrics. You can customize the dashboard to include any metrics.
## Beacon server performance metrics
Use the optional dashboard to monitor the performance of your beacon web servers with Amazon CloudWatch. The dashboard displays custom operational metrics for the servers, including the number of healthy servers, the average processed network packets, aggregate requests, 5XX errors, and Amazon DynamoDB throughput capacity and throttling.



1. **Web Beacon Servers & Logging**:
   - As users interact with a web application or website, their activities (like page views, clicks, etc.) generate events.
   - These events are captured by web beacon servers (often just lightweight web servers or tracking pixels embedded in web pages).
   
2. **Kinesis Data Firehose**:
   - The web beacon servers send these events directly to a Kinesis Data Firehose delivery stream.
   - Kinesis Data Firehose is designed to capture, transform, and load streaming data into other AWS services.

3. **Archival in Amazon S3**:
   - The Kinesis Data Firehose delivery stream performs two primary actions:
     1. It archives the raw events in an Amazon S3 bucket. This archival ensures that you have a persistent, durable storage of raw events for potential future analysis or for compliance reasons.
     2. It sends the raw events to a Kinesis Data Analytics application for real-time processing.

4. **Kinesis Data Analytics**:
   - The Kinesis Data Analytics application processes the streaming data in real-time. This could involve calculations like counting page views, user sessions, calculating average session durations, or any other real-time analytics metric.
   - Once the processing is complete, Kinesis Data Analytics sends the processed data to Kinesis Data Streams.

5. **Lambda & DynamoDB Integration**:
   - An AWS Lambda function is triggered by the Kinesis Data Stream.
   - This Lambda function reads the processed data from the stream and then writes this data to an Amazon DynamoDB table. DynamoDB provides a fast and flexible NoSQL database service, suitable for real-time analytics data.

6. **Real-Time Dashboard**:
   - The architecture sets up an Amazon Cognito user pool for user authentication.
   - An Amazon S3 bucket is used to host a static web application or dashboard.
   - Amazon CloudFront serves this dashboard, providing fast and secure access.
   - The real-time dashboard reads data from the DynamoDB table and displays real-time analytics to users. The interaction with DynamoDB is secured and managed through authenticated sessions provided by Amazon Cognito.

In essence, as users interact with a web page, their activities are captured in real-time, streamed through a series of AWS services, processed for real-time analytics, and then displayed on a dashboard for stakeholders to gain insights.
