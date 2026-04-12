Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7372E937FD
	for <linux-snps-arc@archiver.kernel.org>; Sun, 12 Apr 2026 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJXDt0/v67WpIsClfRu7spuiYsoLy50q0fPSeYTxVE0=; b=GPIxT4239uGoll
	5rCspxNqiFXXs2BUjL3j9oGHF59XeaLEIBf6hxzHWhfLHc8OQj5vBYNhk51Ag83liZJrkVLhSKAL3
	9C2KGe0iscKlz2jXtfqD4UsrPWOgOynQ+aQkxg4CsyR6BJa7p8/i2Jxp/83FB4qcZ7nBiwtvT8Y53
	7yI/YAGvt9q5w70D9HIbLpGpdLnbE7PEE6Shqxr1fO84V5K70C3A1U95ORcl6MHFokl3xydx0XVtT
	n0+cpsxVixQWYhbMf/mWIauLQnqqLc5VT3B4NrBCVWFVQQRSH0dryaZ/5j2bY/ziVYhsmXlB3aUPm
	qXVfi12whed5/HowBgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0b7-0000000EdaQ-1mXq;
	Sun, 12 Apr 2026 19:35:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC0b5-0000000EdZv-24kG
	for linux-snps-arc@lists.infradead.org;
	Sun, 12 Apr 2026 19:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FF96432E2;
	Sun, 12 Apr 2026 19:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31705C19424;
	Sun, 12 Apr 2026 19:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776022554;
	bh=3lYuYx/1DB+7hJAg5aGmApUTLScCCOsrHmPdhP3anUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tLbTht2Cgc9dYEn7WXFORFOWpa8T5Mm9C/qqv+EB1GmPWrtJ/fyQk6Knkujmwutgi
	 dAAInACbW+ruzISmmmPmFfUEweNVQ2Ob/nJsyeWTIcPV0xm2oA/n3GuMZPXhP+C3Im
	 /kXyWQ2jv08S8MZqfZuXaGJA67DcKmeC5oyNVA+ViLDnowC9NRiOawAgoKc4EHxxS9
	 Yvs0F4Uw1th+Bd3M4PNWBybyKwjQpfcZWkS2XqhTMJODIx6F1PfJJ79V033/meC5EW
	 z/v5PqYePWrHYVg7DrL/fO9R/efjfGl5cV3V38bt4DpGiLdMUM3IRpnxeiaktAgT64
	 VrTbvi21FB2hA==
Message-ID: <9c90a400-417c-4459-a82e-84a8b49a107c@kernel.org>
Date: Sun, 12 Apr 2026 12:35:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arc: validate DT CPU map strings before parsing them
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260403161002.2-arc-dt-cpumap-pengpeng@iscas.ac.cn>
 <20260406152001.2-arc-dt-cpumap-v2-pengpeng@iscas.ac.cn>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20260406152001.2-arc-dt-cpumap-v2-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_123555_568011_9286AD20 
X-CRM114-Status: GOOD (  13.82  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


On 4/6/26 00:00, Pengpeng Hou wrote:
> arc_get_cpu_map() fetches the possible-cpus or present-cpus property
> from the flat DT and immediately passes the raw pointer to
> cpulist_parse(). That parser expects a NUL-terminated text buffer, but
> this path does not prove that the DT property is terminated within its
> declared bounds.
>
> Reject unterminated CPU-map properties before handing them to
> cpulist_parse().
>
> Changes since v1:
> - fold the NUL-termination check into the initial lookup test, as
>    suggested by Vineet Gupta
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Vineet Gupta <vgupta@kernel.org>


I've queued it for next ARC pull request, after the rc1 since we are on 
the verge of merge window.


Thx,

-Vineet

> ---
>   arch/arc/kernel/smp.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index b2f2c59279a6..632976c22107 100644
> --- a/arch/arc/kernel/smp.c
> +++ b/arch/arc/kernel/smp.c
> @@ -22,6 +22,7 @@
>   #include <linux/irqdomain.h>
>   #include <linux/export.h>
>   #include <linux/of_fdt.h>
> +#include <linux/string.h>
>   
>   #include <asm/mach_desc.h>
>   #include <asm/setup.h>
> @@ -43,9 +44,10 @@ static int __init arc_get_cpu_map(const char *name, struct cpumask *cpumask)
>   {
>   	unsigned long dt_root = of_get_flat_dt_root();
>   	const char *buf;
> +	int len;
>   
> -	buf = of_get_flat_dt_prop(dt_root, name, NULL);
> -	if (!buf)
> +	buf = of_get_flat_dt_prop(dt_root, name, &len);
> +	if (!buf || !memchr(buf, '\0', len))
>   		return -EINVAL;
>   
>   	if (cpulist_parse(buf, cpumask))
>   		return -EINVAL;
>   
>   	return 0;
>   }

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
