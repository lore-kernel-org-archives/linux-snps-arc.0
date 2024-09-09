Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AEDECE581
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Sep 2024 23:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESRxrs9P8P0S2laN7VkbXIOFdk09vNCDTt3SVOn9NOA=; b=0frkItEDBQeFa6
	m+lYFT1E09exZXI84zEZihlu4GuFbFi+bLvke8zfyTo/CNBEnFYuEsLwCdZwoVdisxQLySizQuZTB
	iqCf1DTU8nlFbnjYkygpW/LVPIPoYZ57uHhfVSbZ5EjOf45VC8QM8ZzmQXlbvj6O4xBpqurcOwzfc
	vTp/inrpmVEFzUOWEX0PMrZeEI5kYT7RXeUV4sHhtBAWARw18iaFYPqFuH/1c+PPCikbrlSGvd+KE
	5tMALNa4Rm670Lx2SwSxfEI9gleEcviG2h3mCBz1X0rgKlIKznjymNE2RRoIvCbBGJyj2UJKfcIVs
	igtcgx7aFK8vThNg73uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snnWi-00000003Xwu-44w4;
	Mon, 09 Sep 2024 23:10:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snnWg-00000003XwN-0Fwr
	for linux-snps-arc@lists.infradead.org;
	Mon, 09 Sep 2024 23:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 084895C01FA;
	Mon,  9 Sep 2024 23:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B64FC4CEC5;
	Mon,  9 Sep 2024 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725923429;
	bh=yTmwkGDBSjNmhNKCbNpOWEm4gM3P8iRRQKz9qPqaIrc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dy55y6uZviDn2rSDIoggp6pQkiZeNSb0dEDdStekafhrJ26WFNHsTIR8lU8kBWVEr
	 IjvNxWxQBxzHqwBWr8ie1TTrLyCHycoGzw6bVjhgZWz/P+ESn0Ot6cPhHsrFDtg8vw
	 TRwSEf1Ka83CVQ7+k/dyFVjjNs0ougpLoeDFucXCx/fGlxa8qmkEsQeumH3Qqiz746
	 dcc6pffXjWxkTwUd1oJEMO1Chw7L9xd2KkTT1TJiJRVzzqH3e9+PPzizHpjr6/wOg3
	 l/iuckwkzKcJCsSQl7Jtzq2Yl2zBGDDvDZnTGqIHwK3syAp5Hnxgh4bcZxrjVy7Li7
	 0wn6KeV+2ebNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70ED33806654;
	Mon,  9 Sep 2024 23:10:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] MAINTAINERS: BPF ARC JIT: update my e-mail address
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172592343000.3950880.978532074406224777.git-patchwork-notify@kernel.org>
Date: Mon, 09 Sep 2024 23:10:30 +0000
References: <20240909184754.27634-1-list+bpf@vahedi.org>
In-Reply-To: <20240909184754.27634-1-list+bpf@vahedi.org>
To: Shahab Vahedi <list+bpf@vahedi.org>
Cc: bpf@vger.kernel.org, vgupta@kernel.org, fbedard@synopsys.org,
 linux-snps-arc@lists.infradead.org, ast@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_161030_169333_CA53E25C 
X-CRM114-Status: UNSURE (   7.35  )
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

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Mon,  9 Sep 2024 20:47:54 +0200 you wrote:
> The previous e-mail address from Synopsys is not available anymore.
> 
> Signed-off-by: Shahab Vahedi <list+bpf@vahedi.org>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Francois Bedard <fbedard@synopsys.org>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Alexei Starovoitov <ast@kernel.org>
> 
> [...]

Here is the summary with links:
  - [bpf-next] MAINTAINERS: BPF ARC JIT: update my e-mail address
    https://git.kernel.org/bpf/bpf-next/c/72d8508ecd3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
