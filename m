Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2934ECA6002
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHcz/1Cps8TNW3fU4e7V7dTbV1JS4wzf+tGbxl+AO/0=; b=cjOpE9wZER2RW5
	vI2sT1yeXX6KUNUw+PVspn5CKHVin9aDwOj74VGqZRSbtPKKQFQzH8O7FA3IM6MhBqjNAzJLJjV/S
	FxL4WTTgpnOTXkvoGNXRLfOtM475Dk9Yo9GOTNmAHTnhBnnt7k5Dy5dSqidM2qj3BLhc4c6rocbUy
	YYrEyR1TjT4/wBCcM15q+2fAhMoDDTFoXI8z/SDJ9AYOyak4uxK74Gw1Wuw9dzy/I55nnp/Dv0+Ni
	iMDcTU7FETDwlvJF/yHXSwlShs/+xyVHcL3UOB4+wgh6JYlgAgLORYRsuTRnlQBxlq92NfM8VzEiC
	NimlRQ0nca/VDc74zc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEU0g-00000002jkc-1hWG;
	Wed, 07 Oct 2026 15:56:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEU0e-00000002jkP-1OPE
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 15:56:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6206E601FF;
	Wed,  7 Oct 2026 15:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CE91F000FF;
	Wed,  7 Oct 2026 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791388607;
	bh=yMhRXbcaDeB4n2+mH5Jk5sbZU+IqnTVA1slEIulptiU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=MVVGJXCQWWbY9TfcSpCe7rr88tctc9aZgvrOvRTdvunYHodclahwQdfCooID67JEs
	 gHnlYWr4Kyzg8SMgTn8+DSyIcCibBPS0MGjG5sttwOCg038edkQh1ouIvfgrj73P3F
	 /mI96/EDR+Tu+ZbwYBlNH8MXltrAaHPPp9PEBv23odVUzHxC71IQ+9Pjnl1zwVz2hi
	 liHGcNdZ5GGQ3zVav9ABzBmf84qaGQDzAlCT2vzoN8kWnyuR0O3TAv8sRhRSfzUylW
	 rbylcb7H8kQWvEco+ck2W/N2zYDGvuhtvHIsX1hAQOLos01O3EVgNFO/VoU5sH+UCF
	 SEspg0zFpN+2w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D045ACE0D79; Wed,  7 Oct 2026 08:56:46 -0700 (PDT)
Date: Wed, 7 Oct 2026 08:56:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	guoren@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
	oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Message-ID: <5937c722-ccc7-4f03-b4a6-bf357f2f3757@paulmck-laptop>
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
 <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
 <a8bc1396-fa38-4648-89c4-ac528fc1888b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8bc1396-fa38-4648-89c4-ac528fc1888b@kernel.org>
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

On Wed, Oct 07, 2026 at 10:24:28AM +0200, Vineet Gupta wrote:
> On 10/6/26 17:44, Paul E. McKenney wrote:
> > These patches need to be applied on top of my -rcu tree's "dev" branch,
> > which supplies cmpxchg_emu_u16().
> > 
> > Nevertheless, thank you for your testing efforts!
> 
> Sorry I don't have your tree is my git remotes. can u point me to the msg id
> of the series which was applied so i can fetch it and apply.
> At this point I can't ACK/Nack the patch since w/o the pre-req it just fails
> to build locally exactly as the kernel robot found.

I will resend the full series later today, Pacific Time.  In the meantime,
these commits in my -rcu tree [1] on the "dev" branch in "git log" order:

a29bf4d6dc4f3 xtensa: Emulate two-byte cmpxchg
10d67fa61f9f4 csky: Emulate two-byte cmpxchg
1decb1d05ef2e ARC: Emulate two-byte cmpxchg
887685c52e44c sh: Emulate two-byte cmpxchg
109f733202e32 lib: Add two-byte cmpxchg emulation function

							Thanx, Paul

[1]  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
