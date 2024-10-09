Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9B9CEE339
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Oct 2024 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FLusjov5bjVtT9gnIf6VEfSDxXRoYmzFM4FgJxTEuNo=; b=iCs
	eC5Vm7hcSoGvojq2A5o8gJpP4VtTd7SYk/POLZ7hV50uIupmFNOsaC/hUeelAOrBUDI4RbEalY8E5
	h/WtEZyrdK/iDO3jHoGJmwE3tBzxAkL+YyOikl+UE14YeJWI9ToDdEIwhSZMkL8oKI0GiHT81hLEe
	y1xfEek3RacoUvEcYMKyFUsZTMbKWmVdQQiX7qo6xA5ikrHOcW0Tqx/CFMs/R0YfPUUOMT5rGoyqY
	D74A3FI+M7LZDs9R45GnM6kUN38aMCyPp4c9rWWIvAXJpLIlAt+H9Pd4JqVkriB8gFTbotib4lF6D
	y0pA/zrtPxqaz2+KODobpmdIbtjVO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaxZ-0000000AIRB-35V9;
	Wed, 09 Oct 2024 17:58:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syauA-0000000AHir-23ip
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 09 Oct 2024 17:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=U7dkSGPF0W7yqCCaqhhTUzdbhYdOOhCep8SiTV8RYs4=; b=dGIdpZFzwWV/IqPrwzV6xo/PuY
	4zeThL8Y01qVNMMcURWntl3qloADLPJrQg1LjTn/bO9I1u2WxOZuS835KN7Jwp3PJaTAvTiBoQ+YU
	ARzz0D/YFajIc5ziGeUdbAgpClYaUmPMlz/KScAF2dKCBBz/xdXqoEXBt70uqZf1w2gS4i4mJiS0b
	4Roq+iZwYw7p2WKUNc/efZRFXqKXT46fv2c2U9NTmJIZxp1IOOoMjJfWWHM1Bpsv37e4zBmvohSSm
	lPVdbziUiRF1JC7Y3u5po5k3vyonSg74cQyaabtIsT7o8n+agsVPsR6oxfYyNAgxWzqw+OM+tkmTy
	9lidURHw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syau5-000000054DC-3vA0
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Oct 2024 17:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CCEDA416F6
	for <linux-snps-arc@lists.infradead.org>; Wed,  9 Oct 2024 17:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B9FC4CEC3;
	Wed,  9 Oct 2024 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728496513;
	bh=1YGuxVVUFMnIT64wnOVEF5YvN1kGXOWmBGuMUEBycUk=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=h4yhj5G8jgZA070kaJh/jWqfZffY5OQOR+OyYw+efM7jzNSnq/Abtke0dec9Fj5gx
	 90M6TeoTMdJFCWtigIxMLMRmPO0ADkneZlAOXIpM2bqxa2ElcnO/ePbhnqpilfZThC
	 q6enAgBy7RaL75aDdABc53UQh5DvPP2OAx94RHfzwYBJ+cVEi51eBAhXpe9dOrf/2A
	 NyrHD+2Wskkrn5YPjY7O0D6hEaXypn8QUy6vDzVY8m+IMRUufZkUc3yGC5aXHiglDs
	 56N7xOPNcwwBszwa6n1sgtr3qIW0ogpGZtmaaDaw/lBDm89BbzGxmDaGAZtAP0FTUj
	 NNNrmU57ZMxxw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1646ECE08E5; Wed,  9 Oct 2024 10:55:13 -0700 (PDT)
Date: Wed, 9 Oct 2024 10:55:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Cc: vgupta@kernel.org
Subject: ARC: Use __force to suppress per-CPU cmpxchg complaints
Message-ID: <c88fafb4-47d9-49b6-aeb6-5a83c9778791@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_185518_173190_2028F9C8 
X-CRM114-Status: UNSURE (   8.22  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Currently, the cast of the first argument to cmpxchg_emu_u8() drops the
__percpu address-space designator, which results in sparse complaints
when applying cmpxchg() to per-CPU variables in ARC.  Therefore, use
__force to suppress these complaints, given that this does not pertain
to cmpxchg() semantics, which are plently well-defined on variables in
general, whether per-CPU or otherwise.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: <linux-snps-arc@lists.infradead.org>

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 58045c8983404..76f43db0890fc 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -48,7 +48,7 @@
 									\
 	switch(sizeof((_p_))) {						\
 	case 1:								\
-		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
