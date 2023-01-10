Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EFAC46467
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jan 2023 07:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbFsW1Q0tXHAn6Ra7eiB4v0MOLw3mxU8tbJGR3SoW2E=; b=tMZxrBbb9fyAt6
	Yd2tDYYHk1CSA4HbWeaomS+xBT/JVmuVABmIFjV83OnFAqE/OYlCJaTlX1fZUglX9ts8/BVI4Cj99
	USZUrGx1jciULqDLhYzeqXuxNl+JWjTjI9e54wKshz1gYFxcXt5U486MTTPcYY1W+EiNTtR480TKD
	jsgPgjwadPwx5vLmq7EWZSveDF5OR0HmiuHO0tqPU9Isl60sRVLLqsVdulhKN/5IAGEfSRyVYki17
	utdhGDMp0xwpugGRxSO/P4TwIuzU3nr7sSUPFP4hhtIV636zOMAkHNdVrolvaoZZTSd69jRgNdlOs
	37Qn9daTMFkSxlyhmHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8vR-005bNh-0f; Tue, 10 Jan 2023 07:20:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8vO-005bMx-Vm
	for linux-snps-arc@lists.infradead.org; Tue, 10 Jan 2023 07:20:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8C85AB81104;
	Tue, 10 Jan 2023 07:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC8EC433F0;
	Tue, 10 Jan 2023 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673335195;
	bh=Vq616gbwymfsGxKmfDRsySN7+m4LEuQS7EzTcz4ZHkI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a/VEo/lCYP+p45d8/rYEc0sbVo2alyJDKrnmcKhyH1AeAYvPU3ycxgcVgKX1RunPO
	 4t9UxdujD0tZzGUYvZTOzwyf1plZh3R5GV25JMhetGZXVvU24CyahRcMay3YnNt0m7
	 yEfkGP2hlcyGEAYUAeIUSG6B/5rMzwuiBuDRkmiK3Qxpjx/nBghqpBMtjXdqH3dQUo
	 T/NyFEnB1rn1LmRxSeQDZf3EMLc1P0mOddpWipv1iR2BQJcvyMqTr3TYz/iC5kVdRT
	 lfbYNKasrzi58el/IUVluM1ATnZFtVbNHa5j6S6Tz22sK/IlCP8dPpkqKSchAYGX8i
	 g9kTLqUCDhdaA==
Message-ID: <b5e0bd90-ff29-d301-30ca-2f12028109ce@kernel.org>
Date: Mon, 9 Jan 2023 23:19:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] bit_spinlock: Include <asm/processor.h>
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vineet Gupta <vgupta@kernel.org>, Dan Carpenter <error27@gmail.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_231959_224422_80CF31A4 
X-CRM114-Status: GOOD (  18.01  )
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


On 1/8/23 11:04, Christophe JAILLET wrote:
> In an attempt to simplify some includes in <include/dcache.h>, it
> appeared, when compiling fs/ecryptfs/dentry.c, that <linux/bit_spinlock.h>
> was relying on other includes to get the definition of cpu_relax().
> (see [1])
>
> It broke on arc.

It its just ARC that broke, maybe we can do something there ?

> Include <asm/processor.h> in <linux/bit_spinlock.h> to fix the issue.
> This will help remove some un-needed includes from <include/dcache.h>.
>
> [1]: https://lore.kernel.org/all/202301082130.LXMj5qkD-lkp@intel.com/
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure who to send this to.
> get_maintainer.pl is of no help, and the file is untouched from a too long
> time.
>
> Greg? Dan? Any pointer?
> ---
>   include/linux/bit_spinlock.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
> index bbc4730a6505..d0fd2a7afca2 100644
> --- a/include/linux/bit_spinlock.h
> +++ b/include/linux/bit_spinlock.h
> @@ -2,6 +2,7 @@
>   #ifndef __LINUX_BIT_SPINLOCK_H
>   #define __LINUX_BIT_SPINLOCK_H
>   
> +#include <asm/processor.h>
>   #include <linux/kernel.h>
>   #include <linux/preempt.h>
>   #include <linux/atomic.h>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
