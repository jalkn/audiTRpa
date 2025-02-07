#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

main(){

echo -e "${BLUE}Starting Django Project Setup...${NC}"

# Create and activate virtual environment
echo -e "${GREEN}Creating virtual environment...${NC}"
python3 -m venv .venv
source venv/bin/activate

# Install requirements
echo -e "${GREEN}Installing requirements...${NC}"
pip install django pandas python-docx PyPDF2 openpyxl

# Create requirements.txt
echo -e "${GREEN}Creating requirements.txt...${NC}"
pip freeze > requirements.txt

}

createProject(){
# Create Django project
echo -e "${GREEN}Creating Django project...${NC}"
django-admin startproject auDitrpa
cd auDitrpa

# Create Django app
echo -e "${GREEN}Creating Django app...${NC}"
python manage.py startapp arpa

# Create necessary directories
echo -e "${GREEN}Creating project directories...${NC}"
mkdir -p arpa/utils
mkdir -p templates/arpa
mkdir -p static/arpa/{css,js,images}
mkdir -p media/{excel_files,pdf_files,word_files}

# Create __init__.py files
touch arpa/utils/__init__.py
touch arpa/tests/__init__.py

# Create utility files
echo -e "${GREEN}Creating utility files...${NC}"
touch arpa/utils/excel_handler.py
touch arpa/utils/pdf_handler.py
touch arpa/utils/word_handler.py
}

main
createProject

# Create views.py with placeholders
echo -e "${GREEN}Creating views.py with placeholder views...${NC}"
cat > arpa/views.py << EOL
from django.shortcuts import render
from django.views.generic import TemplateView

class DashboardView(TemplateView):
    template_name = 'arpa/dashboard.html'

class FileAnalyzeView(TemplateView):
    template_name = 'arpa/file_analyze.html'

class FileDataView(TemplateView):
    template_name = 'arpa/file_data.html'

class ChatbotView(TemplateView):
    template_name = 'arpa/chatbot.html'

class UploadExcelView(TemplateView):
    template_name = 'arpa/upload_excel.html'

class UploadPDFView(TemplateView):
    template_name = 'arpa/upload_pdf.html'

class UploadWordView(TemplateView):
    template_name = 'arpa/upload_word.html'

class ExcelDataView(TemplateView):
    template_name = 'arpa/excel_data.html'

class PDFDataView(TemplateView):
    template_name = 'arpa/pdf_data.html'

class WordDataView(TemplateView):
    template_name = 'arpa/word_data.html'
EOL

# Update settings.py with necessary configurations
echo -e "${GREEN}Updating settings.py...${NC}"
cat >> auDitrpa/settings.py << EOL

# Added configurations
INSTALLED_APPS += ['arpa']

TEMPLATES[0]['DIRS'] = [BASE_DIR / 'templates']

STATIC_URL = 'static/'
STATICFILES_DIRS = [BASE_DIR / 'static']
STATIC_ROOT = BASE_DIR / 'staticfiles'

MEDIA_URL = 'media/'
MEDIA_ROOT = BASE_DIR / 'media'
EOL

# Create urls.py in the app directory
echo -e "${GREEN}Creating app URLs configuration...${NC}"
cat > arpa/urls.py << EOL
from django.urls import path
from . import views

app_name = 'arpa'

urlpatterns = [
    path('', views.DashboardView.as_view(), name='dashboard'),
    path('file-analyze/', views.FileAnalyzeView.as_view(), name='file_analyze'),
    path('file-data/', views.FileDataView.as_view(), name='file_data'),
    path('chatbot/', views.ChatbotView.as_view(), name='chatbot'),
    path('upload-excel/', views.UploadExcelView.as_view(), name='upload_excel'),
    path('upload-pdf/', views.UploadPDFView.as_view(), name='upload_pdf'),
    path('upload-word/', views.UploadWordView.as_view(), name='upload_word'),
    path('excel-data/', views.ExcelDataView.as_view(), name='excel_data'),
    path('pdf-data/', views.PDFDataView.as_view(), name='pdf_data'),
    path('word-data/', views.WordDataView.as_view(), name='word_data'),
]
EOL

# Update project urls.py
echo -e "${GREEN}Updating project URLs...${NC}"
cat > auDitrpa/urls.py << EOL
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('arpa.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
EOL

# Create placeholder template files (essential to avoid TemplateDoesNotExist errors)
       echo -e "${GREEN}Creating placeholder template files...${NC}"
mkdir -p templates/arpa
for template in dashboard file_analyze file_data chatbot upload_excel upload_pdf upload_word excel_data pdf_data word_data; do
    touch templates/arpa/${template}.html
    echo "<h1>${template}</h1>" > templates/arpa/${template}.html # Add some basic content
             done


# Make migrations and migrate
echo -e "${GREEN}Running migrations...${NC}"
python manage.py makemigrations
python manage.py migrate

# Create superuser
echo -e "${GREEN}Creating superuser...${NC}"
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell

# Collect static files
echo -e "${GREEN}Collecting static files...${NC}"
python manage.py collectstatic --noinput

# Start development server
echo -e "${GREEN}Starting development server...${NC}"
python manage.py runserver

# Deactivate virtual environment (this won't execute while server is running)
deactivate