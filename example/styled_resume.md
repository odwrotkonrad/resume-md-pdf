<style>
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap');

  /* PAGE SETUP */
  @page { margin: 25mm 20mm; size: A4; }
  
  body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
    font-size: 11pt;
    line-height: 1.5;
    color: #333333; /* Dark Gray for better readability than pure black */
    max-width: 100%;
    margin: 0 auto;
  }

  /* HEADER (Name & Contact) */
  h1 {
    font-size: 26pt;
    font-weight: 700;
    margin-bottom: 5px;
    letter-spacing: -0.5px;
    text-align: center;
    color: #1a202c;
    text-transform: uppercase;
  }

  /* This targets the contact info paragraph right after H1 */
  h1 + p { 
    text-align: center;
    font-size: 10pt;
    color: #4a5568;
    margin-bottom: 25px;
    border-bottom: 1px solid #e2e8f0;
    padding-bottom: 15px;
  }

  h1 + p a {
    color: #4a5568;
    text-decoration: none;
    font-weight: 500;
  }

  /* SECTION HEADINGS (Experience, Skills, etc) */
  h2 {
    font-size: 12pt;
    font-weight: 700;
    text-transform: uppercase;
    color: #2b6cb0; /* Professional Deep Blue */
    border-bottom: 2px solid #2b6cb0;
    padding-bottom: 3px;
    margin-top: 20px;
    margin-bottom: 12px;
    letter-spacing: 1px;
  }

  /* JOB TITLES & COMPANY */
  h3 {
    font-size: 11pt;
    font-weight: 700;
    margin-top: 15px;
    margin-bottom: 2px;
    color: #1a202c;
  }

  /* DATES & LOCATIONS (The italics in your markdown) */
  em {
    font-style: normal;
    font-size: 9.5pt;
    color: #718096; /* Lighter gray */
    display: block; /* Forces it to its own line */
    margin-bottom: 6px;
  }

  /* BULLET POINTS */
  ul {
    margin: 0;
    padding-left: 1.2em;
  }
  
  li {
    margin-bottom: 3px;
    color: #2d3748;
    text-align: justify; /* Keeps right edge clean */
  }

  /* SKILLS SECTION HIGHLIGHTS */
  strong {
    font-weight: 600;
    color: #1a202c;
  }

  /* LINKS */
  a {
    color: #2b6cb0;
    text-decoration: none;
  }

  @page { 
    margin: 20mm; 
    /* 210mm is standard A4 width. 
       550mm is the height - adjust this number up/down 
       until it fits your content perfectly without extra whitespace. */
    size: 210mm 800mm; 
  }

</style>

# Alex Nowak

Gdańsk, Poland | +48 000 000 000 | alex.nowak@example.com | [linkedin.com/in/alexnowak-example](https://example.com) | [github.com/alexnowak-example](https://example.com)

Platform Engineer | Kubernetes | Cloud Automation

## About

Platform engineer focused on paved-road developer platforms and boring, reliable infrastructure. I build the automation that lets product teams ship without filing tickets.

- Kubernetes Platforms: Operating multi-tenant clusters with GitOps delivery and progressive rollouts.

- Automation First: Replacing runbooks with tooling in Go and Python, one toil source at a time.

- Developer Experience: Golden paths, self-service environments, actionable observability defaults.

## Skills

*   **Core Competencies:** Platform Engineering, Site Reliability, Kubernetes, GitOps, Observability, Incident Response.
*   **Cloud Providers:** Amazon Web Services, Google Cloud Platform.
*   **Infrastructure & Automation:** Terraform, Helm, ArgoCD, CI/CD pipelines.
*   **Languages:** Go, Python, TypeScript.
*   **Data:** PostgreSQL, Kafka, zero-downtime migrations.

## Experience

### **Nimbus Analytics**
**Platform Engineer**
*Gdańsk, Poland | Mar 2023 - Present*

- Built the internal developer platform serving 40 product engineers: self-service environments, golden-path templates, GitOps delivery.
- Cut mean environment provisioning time from two days to eleven minutes by automating cluster onboarding with Terraform and ArgoCD.
- Ran the on-call program: postmortem process, error budgets, alert quality reviews that halved pager noise.

### **Portico Systems**
**DevOps Engineer**
*Remote | Jun 2021 - Feb 2023*

- Migrated a monolithic deployment pipeline to trunk-based delivery with per-service pipelines and canary releases.
- Introduced infrastructure as code across three AWS accounts, bringing unmanaged resources to zero.

### **Bluefjord Software**
**Software Engineer**
*Gdynia, Poland | Jul 2019 - May 2021*

- Developed backend services in Go for a logistics tracking product.
- Owned the PostgreSQL schema migration tooling, including blue/green cutovers.

## Education

**Coastal University of Technology**
*Computer Science*
2015 - 2019

*   **Specialization:** Distributed Systems

## Certifications

*   **Certified Kubernetes Administrator (CKA)** | CNCF (Issued Mar 2024)
*   **AWS Certified Solutions Architect – Associate** | Amazon Web Services (Issued Oct 2022)
*   **HashiCorp Certified: Terraform Associate** | HashiCorp (Issued Jun 2022)

## Projects

**Homelab GitOps**
*2024*

- A three-node cluster managed entirely from a public git repository, used as a testbed for platform patterns.
- **Link:** [example.com/homelab](https://example.com)

## Languages

*   **English:** Full professional proficiency
*   **Polish:** Native or bilingual proficiency
