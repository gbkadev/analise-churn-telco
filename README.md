# analise-churn-telco
Análise de churn de clientes com SQL e Power BI

Análise exploratória de cancelamento de clientes (churn) de uma operadora de telecomunicações, usando SQL para extração de insights e Power BI para visualização, finalizando com recomendações de negócio.

A empresa perde clientes constantemente (churn), impactando diretamente a receita recorrente. O objetivo desta análise é identificar quais fatores mais influenciam o cancelamento e propor ações práticas para reduzir esse índice.

#FONTE: 
Dataset público Telco Customer Churn (IBM), com 7.043 clientes e informações de contrato, cobrança, serviços contratados e status de churn. Fonte: Kaggle - Telco Customer Churn

#MATERIAIS: 
SQL (SQLite) — tratamento e exploração de dados
Power BI — dashboard interativo e DAX

#METODOS: 
Tratamento de dados (SQL): importação do CSV em banco SQLite, tratamento de valores nulos na coluna TotalCharges
Exploração (SQL): queries para calcular taxa de churn geral e segmentada por tipo de contrato, tempo de casa (tenure) e método de pagamento, incluindo uso de CASE, agregações e window functions (RANK)
Visualização (Power BI): dashboard com 3 páginas — Visão Geral, Diagnóstico e Recomendações

#CONCLUSÃO: 
Taxa de churn geral: 26,54%
Contrato mês a mês concentra a maior taxa de cancelamento entre os tipos de contrato
Pagamento por cheque eletrônico tem taxa de churn consideravelmente maior que os demais métodos
Primeiros 12 meses de relacionamento são o período de maior risco de cancelamento
Receita mensal perdida com clientes que cancelaram: R$ 139.130,85

#POSSÍVEIS IMPLANTAÇÕES: 
Oferecer desconto progressivo para migração de contrato mensal para anual nos primeiros 90 dias
Criar programa de onboarding reforçado (contato proativo) nos primeiros 3 meses de relacionamento
Incentivar débito automático/cartão com pequeno desconto, reduzindo a dependência do cheque eletrônico
