Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50389C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Dec 2021 03:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgOo763iHp57C3+Y7YZZWFpbxj+C9r70c/VkV2brdoU=; b=bfociRMqsgM8PUvrb18Iq/HqGI
	tq5x0GbLrXnnvAUY0wD3bBB958gvNmMtMMHZqYErY2frPxEfos8aQWKFP16qYkIqQm+zb+tdWjX16
	XpCqHVuKOa0eWvRW5BWNnnvJQoBuqEWKeCayeJywAPIM90F9tQic+nSG8D8Iv08qIFbJFRxj3lK7O
	GCRprYxtk1vHA66WpWe+UIMK/lNTm/4NnkhlkNziMr2tGoeZM5GKhCGsZ1MdR84sL0fz/XCHfzmqw
	vawPNPMgWhttQg9hWhhIVXx/C3lpD0+i9YIki19daUY+0DVmv1W325jx8YWEjfE7hBWbLBgRaMA3/
	fO0/h8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Q0d-002DN6-TL; Wed, 29 Dec 2021 03:52:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Q0b-002DMR-Tm
 for linux-snps-arc@lists.infradead.org; Wed, 29 Dec 2021 03:52:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9CEE0B80DB1;
 Wed, 29 Dec 2021 03:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C96CC36AE7;
 Wed, 29 Dec 2021 03:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640749931;
 bh=vjtsNUUMkIinnGK3dCSQAtvu19a85YrXX81k+IY0q6k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hZcEcJqjLlhwLmNayO5bcQjvrgLtTskoMhpGJutOl/GwV9LgEvCfp6KHr743OVkiO
 65DcXcge3D9CjxCP9NkRqGQBODuyBmKSD0U2GXqXXWQwb03kkI3bmp/2ONzz3Ovxe4
 QuDz34ouIi0hqCQ4OOFicrbiW0vqistbZpo7W4+W0sguPwNXnUQ03jc+ewgbOjm6Ia
 DO83X6M1csF4vlkJiS29r36DmCBfo3vl+HWCKXVXm98fAYgLN5oLKSARqpcDo2bN2Z
 0Mn1ffVeXALCK7WZiE3I+m5WxoKW9kH1TIe8YTClRaQ/4JiwgF5ROc0i/j8IuqJ9Io
 xa13DFU5UecvQ==
Subject: Re: [PATCH] ARC: dw2 unwind: use swap() to make code cleaner
To: cgel.zte@gmail.com, vgupta@kernel.org
Cc: ye.guojin@zte.com.cn, yangdianqing@yulong.com, wjc@cdjrlc.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
References: <20211110055602.136926-1-ye.guojin@zte.com.cn>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <b49ad227-f849-bea9-5f8d-fc76d130f7fd@kernel.org>
Date: Tue, 28 Dec 2021 19:52:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211110055602.136926-1-ye.guojin@zte.com.cn>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_195214_158691_CD9D52AD 
X-CRM114-Status: GOOD (  16.99  )
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

On 11/9/21 9:56 PM, cgel.zte@gmail.com wrote:
> From: Ye Guojin <ye.guojin@zte.com.cn>
> 
> This was found by coccicheck:
> ./arch/arc/kernel/unwind.c, 251, 22-23, WARNING opportunity for swap()
> ./arch/arc/kernel/unwind.c, 254, 18-19, WARNING opportunity for swap()
> 
> Addtionally, adjust the sequence of header files to be arranged in
> alphabetical order.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
> ---
>   arch/arc/kernel/unwind.c | 26 +++++++++++---------------
>   1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index 9e28058cdba8..ea795304982a 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -10,17 +10,18 @@
>    * is not much point in implementing the full Dwarf2 unwind API.
>    */
>   
> -#include <linux/sched.h>
> -#include <linux/module.h>
> +#include <asm/sections.h>
> +#include <asm/unaligned.h>
> +#include <asm/unwind.h>

No this is not correct. We always include linux/* first followed by any 
specific arch asm/* includes.

>   #include <linux/memblock.h>
> -#include <linux/sort.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/ptrace.h>
> +#include <linux/sched.h>
>   #include <linux/slab.h>
> +#include <linux/sort.h>
>   #include <linux/stop_machine.h>
>   #include <linux/uaccess.h>
> -#include <linux/ptrace.h>
> -#include <asm/sections.h>
> -#include <asm/unaligned.h>
> -#include <asm/unwind.h>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
