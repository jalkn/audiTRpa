# A U D I T R P A

A Django-based web application for analyzing various file types (Excel, PDF, Word) with an integrated chatbot interface.

## Features

- 📊 File Upload and Analysis
  - Excel files processing
  - PDF documents analysis
  - Word documents handling
- 💬 AI-powered Chatbot
- 📈 Data Visualization
- 📱 Responsive Design
- 🔒 Secure File Handling

## Prerequisites

- Python 3.8+
- pip
- virtualenv

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/file-analysis-system.git
cd file-analysis-system
```

2. Make the setup script executable:
```bash
chmod +x run.sh
```

3. Run the setup script:
```bash
./run.sh
```

The script will automatically:
- Create and activate a virtual environment
- Install required packages
- Set up the Django project structure
- Configure settings
- Create database tables
- Start the development server

## Manual Installation

If you prefer to install manually:

1. Create and activate a virtual environment:
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install requirements:
```bash
pip install -r requirements.txt
```

3. Apply migrations:
```bash
python manage.py makemigrations
python manage.py migrate
```

4. Create a superuser:
```bash
python manage.py createsuperuser
```

5. Run the development server:
```bash
python manage.py runserver
```

## Project Structure

```
your_project_name/
├── manage.py
├── requirements.txt
├── your_project_name/
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── auDitrpa/
│   ├── views.py
│   ├── urls.py
│   ├── models.py
│   └── utils/
├── templates/
├── static/
└── media/
```

## Available URLs

- `/` - Dashboard
- `/file-analyze/` - File Analysis Interface
- `/file-data/` - File Data Overview
- `/chatbot/` - Chatbot Interface
- `/upload-excel/` - Excel Upload
- `/upload-pdf/` - PDF Upload
- `/upload-word/` - Word Upload
- `/excel-data/` - Excel Data View
- `/pdf-data/` - PDF Data View
- `/word-data/` - Word Data View

## Usage

1. Access the dashboard at `http://localhost:8000`
2. Upload files through respective upload interfaces
3. View analysis results in the file data sections
4. Use the chatbot for assistance

## File Support

### Excel Files
- Supported formats: .xlsx, .xls
- Maximum file size: 10MB
- Analyzable content: Tables, Charts, Data

### PDF Files
- Maximum file size: 20MB
- Analyzable content: Text, Tables, Images

### Word Files
- Supported formats: .docx, .doc
- Maximum file size: 15MB
- Analyzable content: Text, Tables, Images

## Development

### Adding New Features

1. Create new views in `views.py`:
```python
class NewFeatureView(View):
    def get(self, request):
        return render(request, 'template.html')
```

2. Add URL patterns in `urls.py`:
```python
path('new-feature/', views.NewFeatureView.as_view(), name='new_feature'),
```

3. Create templates in `templates/auDitrpa/`

### Running Tests

```bash
python manage.py test
```

## Security

- CSRF protection enabled
- File type validation
- Secure file upload handling
- User authentication

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Django Framework
- Bootstrap
- Python Community

## Contact

Your Name - your.email@example.com
Project Link: https://github.com/yourusername/file-analysis-system

## Support

For support, email your.email@example.com or open an issue in the repository.