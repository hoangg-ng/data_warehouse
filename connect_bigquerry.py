import datetime

from google.cloud import bigquery
import pandas as pd
import pytz
from google.oauth2 import service_account
import os

# Construct a BigQuery client object.
client = bigquery.Client()

# TODO(developer): Set table_id to the ID of the table to create.
# table_id = "your-project.your_dataset.your_table_name"

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "D:\Code\DataWarehouse\datawarehouse-406906-4f3f691118cb.json"
os.environ["TABLE_ID"] = "datawarehouse-406906.hoang.abc"

# credentials = service_account.Credentials.from_service_account_file(
#     # os.environ.get("GOOGLE_APPLICATION_CREDENTIALS")
# )
client = bigquery.Client(project="dtw-clustering")

def Load_Big_Query(data: pd.DataFrame):  # pylint: disable=invalid-name
    """
    Load the process dataframe into BigQuery data warehouse

    Args:
        data (pd.DataFrame): The processed products dataframe to push into BigQuery
    Return:

    """
    credentials = service_account.Credentials.from_service_account_file(
        os.environ.get("CRED")
    )
    client = bigquery.Client(credentials=credentials, project="dtw-clustering")

    try:
        job_config = bigquery.LoadJobConfig(
            write_disposition="WRITE_TRUNCATE",
        )
        job = client.load_table_from_dataframe(
            data, os.environ.get("TABLE_ID"), job_config=job_config
        )
        job.result()
        print("Data Loaded to BigQuery Sucessfully!")
    except Exception:  # pylint: disable=W0718
        print("Unknown errors occured.")




