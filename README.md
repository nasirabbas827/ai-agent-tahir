# Ai-agent-tahir

## Overview
**Ai-agent-tahir** is a lightweight web‑based AI assistant prototype that demonstrates how a knowledge‑driven chatbot can be integrated into a Flask application. The project bundles a simple admin dashboard, user interface, and a SQLite/MySQL database containing predefined responses and a knowledge base stored in an Excel file.

## Features
- **Interactive chat UI** – Users can ask questions via the `/` (index) page.  
- **Admin dashboard** – Manage prompts, view logs, and update the knowledge base.  
- **Knowledge base** – Pre‑populated answers stored in `knowledge_base/base.xlsx`.  
- **Database integration** – All conversation history and configuration are persisted in `Database/ai_agent.sql`.  
- **Modular templates** – Reusable HTML components (`commonfile.html`) for consistent styling.  

## Tech Stack
| Layer | Technology |
|-------|------------|
| Front‑end | HTML5, CSS (Bootstrap) |
| Back‑end | Python 3, Flask |
| Database | MySQL / SQLite (SQL script provided) |
| Data source | Excel (`.xlsx`) |
| Packaging | RAR archive (`Aiagent-Final-tahir.rar`) |

## Installation
1. **Clone the repository**  
   ```bash
   git clone https://github.com/yourusername/Ai-agent-tahir.git
   cd Ai-agent-tahir
   ```

2. **Extract the archive** (if you downloaded the `.rar` file)  
   ```bash
   unzip Aiagent-Final-tahir.rar   # or use any RAR extractor
   ```

3. **Create a virtual environment & install dependencies**  
   ```bash
   python -m venv venv
   source venv/bin/activate   # Windows: venv\Scripts\activate
   pip install -r requirements.txt   # (create this file if missing)
   ```

4. **Set up the database**  
   - Ensure MySQL (or SQLite) is running.  
   - Import the schema:  
     ```bash
     mysql -u root -p < Database/ai_agent.sql   # for MySQL
     # or
     sqlite3 ai_agent.db < Database/ai_agent.sql   # for SQLite
     ```

5. **Configure environment variables**  
   Create a `.env` file in the project root (or export variables) with at least:
   ```env
   FLASK_APP=app.py
   FLASK_ENV=development
   DATABASE_URL=mysql://user:password@localhost/ai_agent   # adjust as needed
   OPENAI_API_KEY=YOUR_OWN_API_KEY
   ```

6. **Run the application**  
   ```bash
   flask run
   ```
   The app will be available at `http://127.0.0.1:5000`.

## Usage
- **User side** – Open `http://127.0.0.1:5000` and start chatting with the AI agent.  
- **Admin side** – Navigate to `http://127.0.0.1:5000/admin` (login required) to access the dashboard, view conversation logs, and edit the knowledge base.  
- **Updating the knowledge base** – Edit `knowledge_base/base.xlsx`, then restart the Flask server to load the new data.

## License
This project is licensed under the **MIT License**. See the `LICENSE` file for full details.