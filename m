From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 9 Jan 2019 09:39:25 -0800
Subject: [PATCH] ARC: show detaled ActionPoint configuration in mumbojumbo
In-Reply-To: <105ed98c-fdd0-3cbc-825f-f8cd0c782cce@synopsys.com>
References: <20181228164444.11241-1-Eugeniy.Paltsev@synopsys.com>
 <105ed98c-fdd0-3cbc-825f-f8cd0c782cce@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1535da69-d566-6ba1-5631-03c2b8bd998f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/9/19 9:35 AM, Vineet Gupta wrote:
> +		cpu->extn.ap_full = !ap.min;

This needs to be

 +		cpu->extn.ap_full = !!ap.min;
