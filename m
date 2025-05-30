Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1ABC5B549
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 May 2025 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sBzOf6oMPgrc7+7Xju8scfy4FkmtbaIytEWdDyrOO+o=; b=XMNEtRX3jDK+jr
	AkDOxjfbIcT1T9DO6QeKKAnDBYDh0Rk/jGbuqavjGr4yOC3QMFufBNIhxCLBu3/emaBXceX1C7svt
	QW1IkVacampBEBy1s865732riWLWqXasZqjjejXPYW3a/EaeakBdswVjYXbd2Eimn+x+FdGwhoH8Q
	eOJCpKWcgtspWQGCZlK38pPuqz993EYs2xMZnynjoJjtDJhZUS2ETDwdJNPD7ZMHOuvb/aDEAm/1A
	dEi3NFYpmcOYl2/eDOaIeNKJ9hNS776QQbybgeIcOxur9Z46j8tU49v7GhsWEDp4ZqR7WGOdtOpsZ
	dZlEBucUjJ8lEG4WW82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuMn-0000000HTrg-2EHS;
	Fri, 30 May 2025 07:41:25 +0000
Received: from mail.growven.pl ([51.68.70.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuMk-0000000HTqb-4889
	for linux-snps-arc@lists.infradead.org;
	Fri, 30 May 2025 07:41:24 +0000
Received: by mail.growven.pl (Postfix, from userid 1002)
	id 15EF026A7A; Fri, 30 May 2025 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growven.pl; s=mail;
	t=1748590881; bh=YxUJwSDYTiifz63s6cOCrXf5LN2PjYKK0bgKM+svvBw=;
	h=Date:From:To:Subject:From;
	b=VieFrohnaSwrogvw3LssOUtfjT5RxsHSdLZi4qjQlvugKNWnBluripOMj5I6Io7DN
	 KLC04rrKMHWmFdgnXl+QXbhRxQyGGG344BC+I18K/VqYAjjkpDo7ESx4NSxM5qifdK
	 OSq98ljr0nwxwJw5zRu3FphYuWLK/9aBrw+CqNxfNtptvKoPhwYnlh3QdzAHb4otlP
	 FkWvnYn71T/oRtMAkMAj7s0VM6lXHelKSyoDqQoN2GPlh4uNTGVp0Iz2zqOdkHNAsS
	 NSm4nrNtqgbUplxfXZhCg9pAhbRoK8DxhUT5TVo1vGIdgdDUT0U9IcWcztMckXt0gR
	 7ivblWsrmujKA==
Received: by mail.growven.pl for <linux-snps-arc@lists.infradead.org>; Fri, 30 May 2025 07:40:43 GMT
Message-ID: <20250530064500-0.1.2a.hdoy.0.3gfbo4om3v@growven.pl>
Date: Fri, 30 May 2025 07:40:43 GMT
From: "Robert Kozielski" <robert.kozielski@growven.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.growven.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_004123_166271_B90CC551 
X-CRM114-Status: UNSURE (   1.19  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIHN0cm9uxIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KUm9iZXJ0IEtvemllbHNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zbnBzLWFyYwo=
