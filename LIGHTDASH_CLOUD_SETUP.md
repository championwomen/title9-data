# Lightdash Cloud Setup (Recommended)

## Why Use Lightdash Cloud?

The local Docker setup has several limitations:
- Requires S3 storage configuration
- SSL/HTTPS complications
- Limited features in self-hosted mode

**Lightdash Cloud is free for small projects** and handles all the infrastructure.

## Setup Steps

### 1. Sign Up
Go to https://app.lightdash.com and create a free account

### 2. Create New Project
1. Click "Create Project"
2. Select **"GitHub"** connection type
3. Enter repository: `https://github.com/championwomen/title9-data`
4. Select branch: `main`
5. Project directory: `/` (root)

### 3. Connect Your Database
You'll need to expose your local PostgreSQL to the internet temporarily, OR use a cloud database:

**Option A: Temporarily Expose Local DB (ngrok)**
```bash
# Install ngrok (https://ngrok.com)
# Expose your local PostgreSQL
ngrok tcp 5434

# Use the ngrok URL (e.g., tcp://0.tcp.ngrok.io:12345) in Lightdash
# Format: host=0.tcp.ngrok.io, port=12345
```

**Option B: Use Production Database**
If you have a production PostgreSQL database, connect directly to that.

**Connection Details:**
- Warehouse: PostgreSQL
- Host: (your database host)
- Port: 5432 (or your port)
- Database: title9
- User: title9
- Password: (your password)
- Schema: dev

### 4. Compile & Explore
Click "Test & Compile" - your dbt models will appear in the project explorer!

## Benefits of Lightdash Cloud
- ✅ No Docker complications
- ✅ Automatic HTTPS/SSL
- ✅ Full feature set
- ✅ Share dashboards with team
- ✅ Free tier available

## Local Development Workflow

Keep using your local Docker setup for:
- Database (PostgreSQL on port 5434)
- dbt development and testing
- Data loading

But use Lightdash Cloud for:
- Visualization and dashboards
- Sharing with stakeholders
- Production reporting

## Alternative: Keep Everything Local

If you prefer to keep everything local without cloud services, consider using **Metabase** instead:

```bash
# In docker-compose.yml, uncomment the Metabase section
docker compose up -d metabase

# Access at http://localhost:3000
# Metabase has native ARM64 support and works great locally!
```

Metabase doesn't require S3 storage or SSL configuration for local use.
