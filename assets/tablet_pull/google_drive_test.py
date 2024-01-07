from __future__ import print_function
import os.path
import hashlib

from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
from googleapiclient.http import MediaFileUpload

# If modifying these scopes, delete the file token.json.
SCOPES = ['https://www.googleapis.com/auth/drive']

# Define the local folder where the JSONs are stored and the Google Drive folder ID for uploading
localUploadFolder = 'C:/Users/gtvar/Documents/match_files'
topFolderId = '1k1TRXbPCqJI3y9vDsfWe3xG9Idj44wAJ'

def main():

    creds = None
    # The file token.json stores the user's access and refresh tokens, and is
    # created automatically when the authorization flow completes for the first
    # time.
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    # If there are no (valid) credentials available, let the user log in.
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                'json_pull_cred.json', SCOPES)
            creds = flow.run_local_server(port=0)
        # Save the credentials for the next run
        with open('token.json', 'w') as token:
            token.write(creds.to_json())

    try:
        service = build('drive', 'v3', credentials=creds)

        
        
        # Get list of files already in the Google drive folder
        items = []
        pageToken = ""
        while pageToken is not None:
            folderResults = service.files().list(q="'" + topFolderId + "' in parents and trashed=false", pageSize=1000, pageToken=pageToken, fields="nextPageToken, files(id, name, md5Checksum)").execute()
            items.extend(folderResults.get('files', []))
            pageToken = folderResults.get('nextPageToken')

        # Create list of only the file names from Google Drive
        driveFiles = []
        for item in items:
            driveFiles.append(item['name'])
        
        # Get list of json files in local folder
        localFiles = os.listdir(localUploadFolder)
        localFiles = [file for file in localFiles if file.endswith('.json')]
        
        localFileMD5 = []
        for file in localFiles:
            localFileMD5.append(hashlib.md5(open(localUploadFolder + '/' + file, 'rb').read()).hexdigest())


        # Check the file and checksum of each file in the local folder against the files in Google Drive. If it 
        # exists in Google Drive, check if it has been modified. If it has been modified, add it to the list of files to upload.
        # If it does not exist in Google Drive, add it to the list of files to upload.
        filesToUpload = []
        for file in localFiles:
            if file in driveFiles:
                for item in items:
                    if file == item['name']:
                        if item['md5Checksum'] == hashlib.md5(open(localUploadFolder + '/' + file, 'rb').read()).hexdigest():
                            print('File ' + file.ljust(28) + ' - Unchanged')
                        else:
                            print('File ' + file.ljust(28) + ' - Modified')
                            filesToUpload.append({'name':file, 'operation':'update', 'id':item['id']})
                        break
            else:
                print('File ' + file.ljust(28) + ' - New')
                filesToUpload.append({'name':file, 'operation':'create', 'id':None})

        # Check if there are any files to upload
        if not filesToUpload:
            print('\nNo files to upload')
            return
        else:
            # Display list of files to upload
            print('\nFiles to upload:')
            for file in filesToUpload:
                print (file['name'])
            
            # Confirm upload
            numFiles = len(filesToUpload)
            confirm = input('\nUpload ' + str(numFiles) + ' files? (y/n): ')

            if confirm == 'y':

                statusBarIncrement = numFiles / 10
                filesUploaded = 0
                uploadIncrementCounter = 0

                # Upload files to Google Drive
                print('\nUploading files...')
                for file in filesToUpload:
                    file_metadata = {
                        'name': file['name'],
                        'parents': [topFolderId]
                    }
                    media = MediaFileUpload(localUploadFolder + '/' + file['name'],
                                            mimetype='text/plain')
                    
                    # Create the file in Google Drive if it doesn't exist
                    if file['operation'] == 'create':
                        file = service.files().create(body=file_metadata,
                                                            media_body=media,
                                                            fields='id').execute()
                    # Update the file in Google Drive if it has been modified
                    elif file['operation'] == 'update':
                        file = service.files().update(fileId=file['id'],
                                                            media_body=media,
                                                            fields='id').execute()
                    filesUploaded += 1

                    # Display upload progress. This is janky and could be immproved
                    if filesUploaded > (statusBarIncrement * (uploadIncrementCounter + 1)):
                        uploadIncrementCounter += 1
                        print(str(round(filesUploaded / numFiles * 100, -1)) + '%')
                    
                print('100%')
                print('\nUpload Complete!\n')

            else:
                print('Upload Cancelled')



    except HttpError as error:
        # TODO(developer) - Handle errors from drive API.
        print(f'An error occurred: {error}')


if __name__ == '__main__':
    main()