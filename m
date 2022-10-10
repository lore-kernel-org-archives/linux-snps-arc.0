Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4910CC433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Oct 2022 04:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MD5TUaDdwhbnxRFq3bLSesvyX6gQsl9hRw/1gePWjhc=; b=oMqEZ21GjRNgeW
	51X58HJSAGdwCI5I9wm3BugYE6KqZr7nW8m8pElPGPVo7BZojvZdEGMLtsSozc2yFvsqw/29lwvKY
	MKQSpV5O9vNC6j1VOFsBQkuAfLF19nFF18NEZ1nhqmR7fQGx8MgWgAVmGmWGwOGImRFlDcpJ6W1/G
	Kyn8yJFjX+qVY610NXeLASf6uiCaT1p3CsU9G45sW5R3tG9yp7l46AVJ+H1MUZ6NOkCWtKXYi5f3b
	kyF9cSwb8nrgSDbGvzcG9my1U67K3qqfCo0EpfM7Hhv6J9H1U95a47kK5mGoIJx+/A+3rIn996BnD
	+2L/+DAsNtlrEk+yFp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkeH-00H0lK-T7; Mon, 10 Oct 2022 04:44:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkeE-00H0kf-T8
	for linux-snps-arc@lists.infradead.org; Mon, 10 Oct 2022 04:44:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54D19B80E06;
	Mon, 10 Oct 2022 04:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF340C433D6;
	Mon, 10 Oct 2022 04:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665377049;
	bh=g1VytrLgNEwd+q2EYnSIYCJSJm640mEYTeQxP15c3uU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eSKo/VISFLTunBUsMi9uRrKnwbKjyhqVcfChRdXwGpa5aljiLUsgJIQ4Sk/i9JBQk
	 4sUTuTLyhoRFjJVq0QsEIYwq8W35ByJRfAi9chdvypVgcB0rwrS64Jumat06X8XMQ+
	 A3aAxL1cvVVfFVmxe1GThvBbpbCU9xlHBVaii62chQh7iQH6RMFI9oXseNQMNRf0Ng
	 k+2BYfXs/hy1dOKLJos6iRS6VWzDmPWw+Hqo1GyFTNXrZ4+ud6omyobmSOtKSzCodM
	 wx3qntulLhz04cklCb1HyLiLx9O+/5J5L6cYy+yfQqKdaOADlJEY0WL1fGMeIZdx2n
	 V88wjXKUfR30w==
Message-ID: <593925a6-66d3-42bf-19d3-2f54917892ce@kernel.org>
Date: Sun, 9 Oct 2022 21:44:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] arc: iounmap() arg is volatile
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20221010022846.20101-1-rdunlap@infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20221010022846.20101-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_214415_107043_ABFCF382 
X-CRM114-Status: GOOD (  10.03  )
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

On 10/9/22 19:28, Randy Dunlap wrote:
> Add 'volatile' to iounmap()'s argument to prevent build warnings.
> This make it the same as other major architectures.
>
> Placates these warnings: (12 such warnings)
>
> ../drivers/video/fbdev/riva/fbdev.c: In function 'rivafb_probe':
> ../drivers/video/fbdev/riva/fbdev.c:2067:42: error: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [-Werror=discarded-qualifiers]
>   2067 |                 iounmap(default_par->riva.PRAMIN);
>
> Fixes: 1162b0701b14b ("ARC: I/O and DMA Mappings")
> Signed-off-by: Randy Dunlap<rdunlap@infradead.org>
> Cc: Vineet Gupta<vgupta@kernel.org>
> Cc:linux-snps-arc@lists.infradead.org
> Cc: Arnd Bergmann<arnd@arndb.de>

Thx for the fix. On for-curr.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
