Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775F4C77B70
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KZutvm8h3MhLr6fmYbZfa4aWGQdKi/fDCEPJlCb6dtM=; b=PEEJaZ7wrxat7a
	m5rQygntfNhBRl2tBJWk5J283uZxr8Sh+zkp5WV85ubs6L69zhsfqXQ1sR5kEtlhK7sYXTKaHPYoP
	gnlxWVlF2bkQ252MGL8jkiIQpX9mWp8KxnSgYN5YMMgZ9rcxGkdxIe6b6+IEFtRrtm4a2zkRErLYa
	HsCU56Daj6DXaqfvSXxaBseva8R6gtwpAQVkcsQtR2RF3RuKTwKyqoGdmsETe+0okUueVxGflf/DJ
	337Owr4PlwcKOLCIVrw/vifslcjULWJ3bDMUtAZnHSBJ6VtPP9SgzJojsTqWxWVX84fkzydl6UpR2
	myN2WuH25c0omQcNka/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJqv-00FK7l-1G;
	Mon, 17 Apr 2023 08:04:45 +0000
Received: from mail.feshiecree.pl ([89.40.114.103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJqs-00FK5Y-0H
	for linux-snps-arc@lists.infradead.org;
	Mon, 17 Apr 2023 08:04:44 +0000
Received: by mail.feshiecree.pl (Postfix, from userid 1001)
	id 5324788AB3; Mon, 17 Apr 2023 09:01:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=feshiecree.pl;
	s=mail; t=1681718506;
	bh=hFxZwVw4rIL+JwfEOGI47p+fdoVOAeqVswP6NWoHSHQ=;
	h=Date:From:To:Subject:From;
	b=rdg/h0hvngpjezQa4aUwZYghhDwJ2a6RG6gl+w+wQ0KLhF+KcoPQZeIcIBr7UTcMf
	 vY8bL/lQv4UrkiOHSjBF3Go71j+fRHJs5WdNCTacLt5V2PNA4QOn1qHH+O5EwRpoLe
	 btqiEQ+Q9TXyBak18dCKxVb5EONd1AJz1/QoxP1XMz2E82VrIi/In5X6HAxWvMNIYT
	 7UEk4lJAMyJFr4TyM8HfGoUzGTKRNFOr8MbtUZbKbxjQpitMsplVrMcrILqtHAkVca
	 H6BNhlHVcVXaIXfEHHv7Q0iYNNX4CI/79TuiH1Jkvwni3WXyUE+KplI3dviQkloJeq
	 vAXlAoJkTpz1w==
Received: by mail.feshiecree.pl for <linux-snps-arc@lists.infradead.org>; Mon, 17 Apr 2023 08:00:56 GMT
Message-ID: <20230417074502-0.1.22.b6id.0.abj10lar5m@feshiecree.pl>
Date: Mon, 17 Apr 2023 08:00:56 GMT
From: "Krystian Wieczorek" <krystian.wieczorek@feshiecree.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.feshiecree.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_010442_288562_6876CFFE 
X-CRM114-Status: UNSURE (   1.09  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/CgoKUG96ZHJhd2lhbQpLcnlzdGlhbiBXaWVjem9yZWsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
