From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 23 Jan 2018 11:13:59 -0800
Subject: [PATCH 2/2] ARC: boot log: Fix trailing semicolon
In-Reply-To: <20180123151609.23555-2-luisbg@kernel.org>
References: <20180123151609.23555-1-luisbg@kernel.org>
 <20180123151609.23555-2-luisbg@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7cea79ca-562e-f2c7-62d5-143134662549@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/23/2018 07:21 AM, Luis de Bethencourt wrote:
> The trailing semicolon is an empty statement that does no operation.
> Removing it since it doesn't do anything.
>
> Signed-off-by: Luis de Bethencourt<luisbg at kernel.org>

Applied to for-curr

Thx,
-Vineet
