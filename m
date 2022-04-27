Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846B0C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Apr 2022 04:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZP8WadDZPvJ/zyECgEPUxUIPwqNz8elLpMH8O5SGLAY=; b=1KZI+Jk249HFZo
	WB4cTnaMA8K/aMARwdA5BzXcRDjIXje9SPfEtVqj8RWdH38K8Ag2exDrZz5wOJanfyTTuTAGjkTzz
	y76XwFtilkiUG+6ryTkmKTOn6BZRQtXV/chUhjgWqBVbG7/llqNDjMzkwSo5Ei9mfIWgKGAn9DXRy
	9uiUZ5Qw5kga73bEf6nxgQBDYNvnZpTR0dGS7izlB0Tto0LMPh0Wl7FbagYnDWfn4/d+JYZp4+z9E
	cum2VeWLr0wuK0YS9vGPxh6zOxBlTJnFMtQOtIbpYsvOMw0zjezmupM3tiijlr+okEKKb8A0C9F5K
	jmOUccylxUbLnodYUo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njYuo-00HKjF-MD; Wed, 27 Apr 2022 04:04:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njYuj-00HKgm-J2
 for linux-snps-arc@lists.infradead.org; Wed, 27 Apr 2022 04:04:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD550B81366;
 Wed, 27 Apr 2022 04:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B98C385A7;
 Wed, 27 Apr 2022 04:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651032256;
 bh=ST96TgtfQbcD+6J86M8dTu8Pw2qKIYGdS+Rty7UiBdE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=emzWDMdZ56gRgGyu3lfntRnfeevPQCJe+ngkzkxkPL9AFOZL4x016EwftekdnVqqs
 j8/7iugZ+YStcrgPWvi/npHvNcTpP1VN7hyAgCimPVgzlJ2qE9THyVp753ixdMsVnr
 SL14XCjU2sHeZDlnIOsdtHmj3cKaKeN5YUm7cAdvRoYE6RHuOUcVFXieEJd+VtzN7O
 I+p9ACfbBESo1MvaJT1IqxlDjjulsblTWCP7KdsyqHt2FgH5EYgaPwJJI9y7Usku6a
 BlwxTtYqorwwglhicNyJMn97BU/DaoV8O1lODnve+JNpE3yOAt0mbDJGDbyghrPIFl
 o9z7dykJ6MbPg==
Message-ID: <f87e457e-72fe-7d39-5045-3c8d2271f638@kernel.org>
Date: Tue, 26 Apr 2022 21:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [vgupta-arc:for-next 3/4] arch/arc/kernel/disasm.c:494:23: error:
 'struct pt_regs' has no member named 'gp'; did you mean 'fp'?
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-snps-arc@lists.infradead.org
Cc: kbuild-all@lists.01.org, Vineet Gupta <vgupta@kernel.org>
References: <202204260826.d9fdltJm-lkp@intel.com> <Ymef0FkwCE/hdUtb@curiosity>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <Ymef0FkwCE/hdUtb@curiosity>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_210429_822190_8AA88CE0 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On 4/26/22 00:31, Sergey Matyukevich wrote:
> I have just sent a fixup for this snafu:
> https://lore.kernel.org/linux-snps-arc/20220426072447.125975-1-geomatsi@gmail.com/T/#u
>
> IIUC, you have not yet sent a pull-request for next release. So probably
> it makes sense to squash this commit with b08a66fb680018b6 ("ARC: disasm:
> handle ARCv2 case in kprobe get/set functions").

Yes this is merge-window stuff so will go in next cycle.
I've added a fixup and push for-next.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
