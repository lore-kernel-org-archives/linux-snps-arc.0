Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD5EE9D822
	for <linux-snps-arc@archiver.kernel.org>; Sun,  5 Apr 2026 21:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9q9pH2i92EehdJaacdp4KeGNMfZdcnfUWL4WZehryU=; b=rgUj3q4K7bYUZi
	HnW8VRq4Av4IDwXhbKvQZKAp7o2MoLchB8k3BTn1ZjxHq8CkRS8fjyJDip8aLqiZuDzs73nsiKrYe
	YI/FbgOInI5Va8PADIcPdE+X1ZwQs9orO2qU7nYYDN18N0X1ENULHBtpf024CcoydVNto+Fr3wdBm
	ZGV6t8QtgSLgtDiyhdhfyAWqgQk0RxrSvz/0OlXB65mXdm/1PX6IXNf2AthbHsiLL1EO52NT0ZLS3
	4jnUA+BNMH6ZjDVo6wNk88D5jx9YDtutFD48hsZ1tgod7HRQjYRppdulHNXtQldPUiUiBBLDTRAg3
	Ec71m00NOyB5KOnHRVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9V8c-00000004UsF-3tGu;
	Sun, 05 Apr 2026 21:36:10 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9V8X-00000004Urr-2whB
	for linux-snps-arc@lists.infradead.org;
	Sun, 05 Apr 2026 21:36:09 +0000
Message-ID: <c5d35809-293d-4bfe-bc94-d880980480c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775424959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7OArgJEPAI8F9DmozjP0epZraZMY00IfFSc2+NfThhY=;
	b=iYD1rEFTOMmiYxH5LKrwkaMdCn2vdovwpMN1J2bKTbYpdEbRKgY3PhsFbjwIiN7mDUMnCe
	6/cTtiSs628IH+yixriuiVLYMEcTDpJdhU8sBEPzjGhy7eVJODGpGo5pX78aUJopROQBxM
	3Y022ISYvCHgXNZEXtAp/irQpvWmC3c=
Date: Sun, 5 Apr 2026 14:35:45 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] arc: validate DT CPU map strings before parsing them
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260403161002.2-arc-dt-cpumap-pengpeng@iscas.ac.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20260403161002.2-arc-dt-cpumap-pengpeng@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_143606_463800_018DA4B4 
X-CRM114-Status: GOOD (  12.29  )
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

On 4/2/26 22:41, Pengpeng Hou wrote:
> arc_get_cpu_map() fetches the possible-cpus or present-cpus property
> from the flat DT and immediately passes the raw pointer to
> cpulist_parse(). That parser expects a NUL-terminated text buffer, but
> this path does not prove that the DT property is terminated within its
> declared bounds.
>
> Reject unterminated CPU-map properties before handing them to
> cpulist_parse().


Seems like a reasonable improvement.


> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   arch/arc/kernel/smp.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
> index b2f2c59279a6..e0f8218e9172 100644
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
> @@ -43,11 +44,15 @@ static int __init arc_get_cpu_map(const char *name, struct cpumask *cpumask)
>   {
>   	unsigned long dt_root = of_get_flat_dt_root();
>   	const char *buf;
> +	int len;
>   
> -	buf = of_get_flat_dt_prop(dt_root, name, NULL);
> +	buf = of_get_flat_dt_prop(dt_root, name, &len);
>   	if (!buf)
>   		return -EINVAL;
>   
> +	if (!memchr(buf, '\0', len))
> +		return -EINVAL;
> +


Maybe fold this check into first one as !buf || !memchr(...)

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
