Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B06E77184
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Dec 2024 00:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iH/4vwp/moH65olm3XKjkmQKD7H2PRqW6vJSwfTq15c=; b=hI71mJ4CNYD8OG
	n/QNsEddDgc4dwD3403fJt79GUWUElAEVpO8CEphmxBOOAKlOsa3dicHYGHT0E3Lt1MLUdcmUGwV6
	Ce6OtxTEsj9NODSLlFiC1+b77RTu85ZrCV/yxzI9zdO5MsncCtQPx+SJ+RGKZYj5Sdr2RFdoIYnWS
	Tci1k2dV11sUCyD3bZFXrHow4SGxHmHAnc6apG0wr+w5aVxfQWSudWMVWA09cWHFUXU0kHlSe9Csw
	RnuiWaNfqnt1i7wrpwuGaC9ckq2xP9YPoGNYNK+G5Q6FoMMVgHZGppcMkeNM5xndFx4KFkCQ7A0Rl
	a9WeKMnzYJkqgUS3dLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLpJ-0000000Bo6v-2jWq;
	Tue, 17 Dec 2024 00:52:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLeg-0000000Bl29-3qwb
	for linux-snps-arc@lists.infradead.org;
	Tue, 17 Dec 2024 00:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B3BDA41BCB;
	Tue, 17 Dec 2024 00:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12F7C4CED0;
	Tue, 17 Dec 2024 00:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734396099;
	bh=Ka+OMSaqE1tqko01dYUFN1zerLG7QyUuZt4Xtr1VtVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmTTTeOgGwQUKcETSk7JN9uS1HwjCzwU8/9sGIO3Bmrw15uctQ/lYEqdK/Y2LSc36
	 sVRGyQIDFzYTswQB4XJjQuHhYx9O1fqa3MCoBjBngnZMdDWjTdZ1vQSA4ZnrXq1apM
	 H9uWgDD5vchsL3JqZrjjgkuSeehBzjVSoBOMqyfhJeaaEIeN1NvM+1Le09/EnfsIoJ
	 LTKU4scWe5S2hdTTM1QCmRn2znete1zt7t3IduwDQoj7szNb484ObmGOcP7KP82AIq
	 qDk9g26Henr6xwrF7vH+dSu3Evhh1aTu0S+f/QCuMBGKj44cWhlYq5V+wuUrlOwuwA
	 acPDcBfFbH4vQ==
Date: Mon, 16 Dec 2024 16:41:36 -0800
From: Kees Cook <kees@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	x86@kernel.org, linux-snps-arc@lists.infradead.org,
	linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH 5/7] security: Replace get_task_comm() with %pTN
Message-ID: <202412161641.8209C666@keescook>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-6-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213054610.55843-6-laoar.shao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164143_045885_DE1EB222 
X-CRM114-Status: UNSURE (   6.94  )
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

On Fri, Dec 13, 2024 at 01:46:08PM +0800, Yafang Shao wrote:
> Since task->comm is guaranteed to be NUL-terminated, we can print it
> directly without the need to copy it into a separate buffer. This
> simplifies the code and avoids unnecessary operations.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

Looks good to me; thanks!

Acked-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
