from azure.core.credentials import AzureKeyCredential
from azure.ai.language.questionanswering import QuestionAnsweringClient
import os
from dotenv import load_dotenv

load_dotenv()
ai_endpoint = os.getenv("AI_SERVICE_ENDPOINT")
ai_key = os.getenv("AI_SERVICE_KEY")
qa_project_name = os.getenv("QA_PROJECT_NAME")
qa_deployment_name = os.getenv("QA_DEPLOYMENT_NAME")

def get_language_model_client():
    """Initialize and return the QuestionAnsweringClient."""
    credential = AzureKeyCredential(ai_key)
    client = QuestionAnsweringClient(endpoint=ai_endpoint, credential=credential)
    return client

def get_knowledge_base_answer(client, question):
    client = get_language_model_client()
    question = ""
 
    while True:
        question = input("Enter your question (or type 'exit' to quit): ")
        if question.lower() == 'exit':
            print("Exiting the program.")
            break
        response = client.get_answers(
            project_name=qa_project_name,
            deployment_name=qa_deployment_name,
            question=question)
        if response.answers:
            for answer in response.answers:
                print(f"(Answer: {answer.answer})\n (Confidence: {answer.confidence}) \n (Source: {answer.source})")
        else:    
            print("No answer found.")

   
if __name__ == "__main__":
    client = get_language_model_client()
    get_knowledge_base_answer(client, "")