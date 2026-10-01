#!/bin/bash
set -e

dnf install -y docker
systemctl enable --now docker
usermod -aG docker ec2-user

mkdir -p /opt/cloudops

cat > /opt/cloudops/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CloudOps Status Dashboard</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #0f172a;
      color: #e2e8f0;
      display: grid;
      place-items: center;
      min-height: 100vh;
    }

    main {
      width: min(600px, 90%);
      padding: 32px;
      border-radius: 16px;
      background: #1e293b;
      box-shadow: 0 20px 45px rgba(0, 0, 0, 0.3);
    }

    h1 {
      margin-top: 0;
    }

    .status {
      color: #86efac;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <main>
    <h1>CloudOps Status Dashboard</h1>
    <p class="status">● All systems operational</p>
    <p>Dockerized application deployed to AWS EC2 using Terraform.</p>
  </main>
</body>
</html>
EOF

docker run -d \
  --name cloudops-dashboard \
  --restart unless-stopped \
  -p 80:80 \
  -v /opt/cloudops/index.html:/usr/share/nginx/html/index.html:ro \
  nginx:alpine