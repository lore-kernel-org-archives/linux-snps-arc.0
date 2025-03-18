Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5E2C28B28
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Mar 2025 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SwbNqVRrovvtUlxKRQYkulyMSd8PeixKBxXp/oI0siI=; b=QhA3C3WByCwult
	uT47avvBldi0zD5gVSnV9A+JqLft4TP1SKX3VEWxcVYcgPFzNoptGh9bmEwU9/j3pyGugPa1FFCvT
	q6xz6re5Y8rEhzvVB3vCrwzzZkZBQ2KpPoe5UCNpnZgRlbSRaop4h2BwUda0mVxicSyDTa9KfH3Fy
	Gvu2gZaHvqe/AqDnmsxLAvKKE4+6rcWh0YSn6zyvz7w2/jxko/SMEpI53pFIp1MWhU9VK7mpPUjSm
	5322OmUQ4EKtrZkgOcfLXM1LDP8oqjzC139OXZzaz4U3qpzkNpqkO+KqPEKHtKY816t4fS4KC0ov3
	Iv5dGjFNyjg70FP+2jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSrF-00000005GD8-3T75;
	Tue, 18 Mar 2025 09:03:33 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSk1-00000005Eys-121c
	for linux-snps-arc@lists.infradead.org;
	Tue, 18 Mar 2025 08:56:09 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 1F41EA3809; Tue, 18 Mar 2025 09:55:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1742288160; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=z4mnSm15zfkR6MxjBGNN4/0wdDd9pPiYzlRiuv/ifmJTrdJvByBFi0uYsybo69ldJ
	 JwPkOUWrs48u1Vb4Npe5p24zfU3Hy+6qW2jPmzX3ZEbnot7b8uX+r2bzeZwgyLIAFs
	 /6phcOg+K038RbNYWivFuTKPFN/QpslU89Xc/qK1h38eWDajhECix5As+7nbXTohQw
	 e6t1VajGMN1D2YEzxJrzpKOOuJTQQ/nScWhrS9XA7AukSUXrClItU7WdSPlXufsccD
	 WMxuqqD5ZK1autsg8B1cxATr14ubkk27efqAfC9JZOFs++JIgi9kVaHm2OH7GvBaP3
	 ZaUcZH2eoxwKg==
Received: by mail.novaplan.pl for <linux-snps-arc@lists.infradead.org>; Tue, 18 Mar 2025 08:55:43 GMT
Message-ID: <20250318084500-0.1.kh.1h58i.0.dp3ojui04s@novaplan.pl>
Date: Tue, 18 Mar 2025 08:55:43 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_015605_965588_5DE4C1BD 
X-CRM114-Status: UNSURE (   1.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
