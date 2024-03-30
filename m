Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85BACD1283
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Mar 2024 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW79+s3Byty/1VvDTTUpEM8N+eISMdh4Yg2trsfD+SU=; b=ZbZO83MIVnYE89
	pNb+0gYtelvV8+UqddoPmUwnWcD6Vwg3d3ylG+r5dcgesGxekgFoqrU8yteCDZwCk0tZNOczxnzoZ
	KPqIgmNFnnNRn0CwEjjduyJygHznpPptHjQ4c4fzgKGcmSnPWTzg+eaXOGglW0quXoYWYsHXq5Zfg
	Afc8LKisnxhlf69LARS/ga57abSCh0kMZVsLjMh+Pyv2b9sj2SEtqyL25PhAG9FOhhjeEeTGqN2aW
	C+03qoGng4WJ/BJ6aEhtLuhWeTxqYqiZs6hLo5JG4Ai+vn25xcYMWQyn6mqR60kMS94wPehalu3z+
	4dgJDM9cBdNHSHStSOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqN5w-00000002Sxq-3Fm4;
	Sat, 30 Mar 2024 01:01:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqN5b-00000002StB-39Er
	for linux-snps-arc@lists.infradead.org;
	Sat, 30 Mar 2024 01:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E574661ACE;
	Sat, 30 Mar 2024 01:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5898FC433F1;
	Sat, 30 Mar 2024 01:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711760454;
	bh=SB7j8kvTH9NRoI/QoVhyjgvW8q8QZckfgiEKfKSpBwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qek4aQUiuNWz+CCuXQ3/bYg0/2hUw22G8C7TwIb6S96ayMSqTVi3HaLD8vu0OFzP7
	 Xr+Oj+T8pKoaCrVPXgH8cEVi000Ze6y3eLgL+j2bgLrKMMTog7cT9nTNczqeZtlWHa
	 +bePIIs+y/N8+tp8itixo1qLus5Lr1uit3cm5mywWsqLVZwcaM2E1ndZm3s6rkBlXV
	 X+fSlKeAmyisxhph0PiC92R2jzQm301Rs0PEpH2X04uVKFAk4uxuA3NXRF2KShPZT0
	 PWo+CrYE2f6b79vq2J/yCaVmqnpwedFtjHSDlwtaCNzixyBCJdlzdLToWqOnYwwxBI
	 E/Njp4TXfNV1g==
Message-ID: <5d4ca5e7-c516-4f0d-9794-f3cef8826f78@kernel.org>
Date: Fri, 29 Mar 2024 18:00:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARC: Fix typos
To: Bjorn Helgaas <helgaas@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
References: <e5bacec0-28ca-4cd9-9ffe-92feaf5fbfef@kernel.org>
 <20240329221432.1658516-1-helgaas@kernel.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20240329221432.1658516-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_180058_508530_F485638F 
X-CRM114-Status: UNSURE (   3.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/29/24 15:14, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Fix typos, most reported by "codespell arch/arc".  Only touches comments,
> no code changes.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Added to ARC for-curr.


Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
