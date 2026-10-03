# Incident: CloudOps Dashboard Container Outage

## Summary
A controlled outage was performed to practice diagnosing and recovering a stopped Docker container.

## Impact
The CloudOps dashboard was unavailable while the container was stopped. No data was lost.

## Symptoms
- The browser could not load the dashboard.
- The EC2 instance was still accessible through AWS Systems Manager.

## Diagnosis
I ran `sudo docker ps -a --filter name=cloudops-dashboard`.

The container showed `Exited (0)`, meaning it had stopped cleanly rather than crashed.

## Root Cause
I deliberately stopped the only application container using `sudo docker stop cloudops-dashboard`. Because the website runs in this single container, the site became unavailable.

## Recovery
I ran `sudo docker start cloudops-dashboard`, refreshed the public URL, and confirmed the Version 2 dashboard loaded again.

## Lessons Learned
- Check container status when a website is unavailable.
- Systems Manager allows diagnosis without opening SSH.
- A single-container deployment has no failover.

## Evidence
- [Website unavailable](../screenshots/26-container-outage.png)
- [Stopped container](../screenshots/27-container-stopped-diagnosis.png)
- [Website recovered](../screenshots/28-container-recovered.png)