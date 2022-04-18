Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21B4C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mag9fbqw3nyqL7g/oQgevIynJ9Jy+fjaccZA4SDrALw=; b=dRTi0HN94Mrd88
	/3nlVxVrpAnebnwSRzpjEtuT1B4xs6XBNLG65MEdeNV8TU9pd/qXBQPefq2/MEdOWVXwbRHTMIAGR
	HUFxpd2wvmX0yf/Af1prt8mBzoXSboa+zFlaoASQduNQxnbQ5aylQUT2atbxqjXbN4PDZDd2SacxI
	A4x5ACCoSxdvU9Luukrj1RQjwPdUu+GFj81m2AomqMNyERnOQfHsCPDrkJ8ZyDg1geit5cmuFWJ+O
	BcbG3McVbrSBC+baBVew1vpmjyQsvgefkxCur3vBjWbQSH/5W4NG1UVjsQbpKfZuLSKJ7Nduzqo8T
	jKPOiYWbwN1IpKXpAwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngWp9-000Q0S-Qf; Mon, 18 Apr 2022 19:14:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngWp6-000Pzs-Mp
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:14:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58824B80EE2;
 Mon, 18 Apr 2022 19:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E305EC385A1;
 Mon, 18 Apr 2022 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309246;
 bh=2NRqj6gTeQtlZSxIZvJOYz6CTq41IdTKElYuPQNy6XA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rl6/LbBVUp0xN95c5Rg/8jSt54cN83cHuBTztqLo2CmiaPSBoKl2GhfV2qw02LiGv
 DTSm2bM7MnC3JbuCm6fCSIDZL6vgIY5az0MNLMWZ5e2eQM40i7lCM6BPr+pNu8+cdg
 8bu/+YiciEoAdoGfZNT22s49j7CAOle6Yb4eqhBds4vy1gokAR9z8NfCLIg2bnN2m9
 Gmn1v9nfIl0ivcMnorf1FDMwYuVY0BSeK10dhzWEQUrqlwRQuR5hgMSkxu7kg2d5cO
 hfGOJ/EnUFO2vhKWYBpcoezKTstz2lx/0hAGBNiyM5iEvh+aw1HIHaHFNjPXlz9fu6
 R6vpBC19vBPSg==
Message-ID: <4653468c-f23c-4788-105c-19c6dc9856e2@kernel.org>
Date: Mon, 18 Apr 2022 12:14:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] ARC: entry: fix syscall_trace_exit argument
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
References: <20220414081724.3177956-1-geomatsi@gmail.com>
 <20220414081724.3177956-3-geomatsi@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220414081724.3177956-3-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_121408_933172_85DA5B8C 
X-CRM114-Status: UNSURE (   8.45  )
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


On 4/14/22 01:17, Sergey Matyukevich wrote:
> From: Sergey Matyukevich<sergey.matyukevich@synopsys.com>
>
> Function syscall_trace_exit expects pointer to pt_regs. However
> r0 is also used to keep syscall return value. Restore pointer
> to pt_regs before calling syscall_trace_exit.
>
> Signed-off-by: Sergey Matyukevich<sergey.matyukevich@synopsys.com>

This is independent fix and worth stable backport, So I'll apply it to 
for-curr, rest of the pile goes for next release.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
