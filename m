Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C916AC54EBD
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Jan 2023 22:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFETfGpSD+pKbiu8NdXNlqRjKkWQPUJ4oNqIU3ePL8c=; b=yt+z+g4b7J6NJz
	fYmZQAhm9Q2dxlUIJ9h8MX5pqh47BSsmmxd7yUo0K0wJVpRRlJXovZHhbOi4uZOmwDwSfuwiAR1oY
	vsjw6RX3Y4HF+G8xOFIR5yfgfUDKZryz4VOSflpsjOHt2nLQiaG2SKqKUOLeFqs2UgIxR94QjONa3
	ieijKiT88D3AXuhw7PvswOrZH9ZeuKtl5VxfzK5Q/PhaTO/cAY5bT6wsCoTOnpgRb2VT4gv11aaXo
	6/V8abMZR3r+69J7+NGbf6oUwmQl272YHea90V3BWHThRd2ltDW6kIb+oj4aKqFU2zHcWKxYsKgxm
	B1yCXgl3/BIkb2oBhhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0uD-004XHZ-6A; Mon, 09 Jan 2023 22:46:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0uA-004XGu-SM
	for linux-snps-arc@lists.infradead.org; Mon, 09 Jan 2023 22:46:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5858561447;
	Mon,  9 Jan 2023 22:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520AAC433EF;
	Mon,  9 Jan 2023 22:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1673304368;
	bh=Smpr3DrhasTIUOdQUCkLW1n6OMxtHjQcAGkhZhSSagU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NrWnulaBpJswTJNHy51afCrsavlOnbtuYkpyeTJoDlBMYqgN/PeSkGKExpci/qM4d
	 WbVIfcvQBMqAan8/zukuIIu+2yZRT6exWCBTwZTobsdkdh/s1Hh1WFo5VfhgHYzcQG
	 3eOWgRys64FEGm9Cl9Ky5N+bwLQTBYBZ7fNjiufo=
Date: Mon, 9 Jan 2023 14:46:07 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vineet Gupta
 <vgupta@kernel.org>, Dan Carpenter <error27@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bit_spinlock: Include <asm/processor.h>
Message-Id: <20230109144607.02edd319f9b5e25ee774f9a5@linux-foundation.org>
In-Reply-To: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
References: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_144610_984187_B389B62A 
X-CRM114-Status: GOOD (  13.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun,  8 Jan 2023 20:04:44 +0100 Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> In an attempt to simplify some includes in <include/dcache.h>, it
> appeared, when compiling fs/ecryptfs/dentry.c, that <linux/bit_spinlock.h>
> was relying on other includes to get the definition of cpu_relax().
> (see [1])
> 
> It broke on arc.
> 
> Include <asm/processor.h> in <linux/bit_spinlock.h> to fix the issue.
> This will help remove some un-needed includes from <include/dcache.h>.
> 
> [1]: https://lore.kernel.org/all/202301082130.LXMj5qkD-lkp@intel.com/
> 
> ...
>
> --- a/include/linux/bit_spinlock.h
> +++ b/include/linux/bit_spinlock.h
> @@ -2,6 +2,7 @@
>  #ifndef __LINUX_BIT_SPINLOCK_H
>  #define __LINUX_BIT_SPINLOCK_H
>  
> +#include <asm/processor.h>
>  #include <linux/kernel.h>
>  #include <linux/preempt.h>
>  #include <linux/atomic.h>

linux/processor.h would be preferable, rather than diving straight into asm/?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
