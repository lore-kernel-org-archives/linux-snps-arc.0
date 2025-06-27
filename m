Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBDBC77B7F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Jun 2025 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vJt0+UqRrAXK+v+uYFgy7aNuSsFjiHQ9xkdJI1xA3js=; b=z0SvT34FZYsYri
	PeDb+yj8+AA37VW3M+lqvoDhrYzf+LcCJahU6MeBVBk+SEvwuUTXts1IcKev5glvgRt+xJrltvXPD
	cYM8sHnEjbF8uvVyg+HHcD6nN8FN7SJ6Gckazi64qqEuysy0cgOf+FLjT9S9A8oFJaHuEKjzjKsFA
	/Khi4xw9E1nuMzZ7vycQHpL/eHuPGBPrZG24gk78C+zyZDSBE8uCa0PWUhRh526tNdhcZFP2WAxXS
	gy4QUZPbM3BrmhNvq25Chjd9lqykhJ1QpG+6ZOTUVsSyPuXZL4qN5tc+j0mcmq5Lm5VRS+MFAEw/J
	+t/E6pW954CDo4A3DUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3vF-0000000DtMa-1Jom;
	Fri, 27 Jun 2025 07:54:57 +0000
Received: from mail.quantro.pl ([51.195.47.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3lA-0000000Drjs-26Kr
	for linux-snps-arc@lists.infradead.org;
	Fri, 27 Jun 2025 07:44:34 +0000
Received: by mail.quantro.pl (Postfix, from userid 1002)
	id 0BA8427921; Fri, 27 Jun 2025 09:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quantro.pl; s=mail;
	t=1751010091; bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=;
	h=Date:From:To:Subject:From;
	b=ihY9VBhmq16pjp1PxNcsjsfbP6EXmn4j0lJzwlr2FPlk3iqXR8DyzqbkyDVbgF4Fk
	 tUwJRKslHt/f6nZB1XrmPuYRz2xkc1ry8C1RqR/O667nU9oycXV4pswoECiyR7CSbX
	 qhZQAEv372+G8uuOFGB/E4v+zF3Yd6FmtYZDoBoJi/nozfskNNUDdcAz8rj7nSZRpe
	 YdYwWhQSvlYiBNsQwDExYm7EvwQdkLJSjZ4mdfMrFw5/G9V3omkubem+LumHCNGGMt
	 nPHs4/64remscZfPls80eDTEPrqgTsX0LTCcYRL+ozB2Hr3798BoqgXnZgEx3xBJLG
	 ZwWGLGKnoEHtQ==
Received: by mail.quantro.pl for <linux-snps-arc@lists.infradead.org>; Fri, 27 Jun 2025 07:40:30 GMT
Message-ID: <20250627084501-0.1.if.5lew0.0.9xja5gzggx@quantro.pl>
Date: Fri, 27 Jun 2025 07:40:30 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@quantro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.quantro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_004433_236190_235013BF 
X-CRM114-Status: UNSURE (  -0.26  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjenkgemFzdGFuYXdpYWxpIHNpxJkgUGHFhHN0d28sIGphayB6
d2nEmWtzennEhyB6YWRvd29sZW5pZSBwcmFjb3duaWvDs3cgaSBqZWRub2N6ZcWbbmllIHphb3N6
Y3rEmWR6acSHIG5hIGtvc3p0YWNoIHphdHJ1ZG5pZW5pYT8gCgpPYmVjbmllIGplc3QgbW/FvGxp
d2/Fm8SHIHp3b2xuaWVuaWEgeiBvcMWCYXQgWlVTIGHFvCBkbyA0NTAgesWCIG1pZXNpxJljem5p
ZSBuYSBrYcW8ZGVnbyBwcmFjb3duaWthIHBvcHJ6ZXogZG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dy4gCgpaYSBwb21vY8SFIGthcnR5IGx1bmNoIHByYWNvd25pY3kgbW9nxIUgcMWCYWNpxIcgdyBy
ZXN0YXVyYWNqYWNoLCB6YW1hd2lhxIcgamVkemVuaWUgb25saW5lLCBrb3J6eXN0YcSHIHogY2F0
ZXJpbmd1IGN6eSByb2JpxIcgemFrdXB5IHNwb8W8eXdjemUuIFRvIGRvc2tvbmHFgmUgbmFyesSZ
ZHppZSBtb3R5d2FjeWpuZSwga3TDs3JlIHRha8W8ZSB3eXLDs8W8bmlhIGZpcm3EmSBuYSByeW5r
dSBwcmFjeS4KCkNoxJl0bmllIG9wb3dpZW0gd2nEmWNlaiBuYSB0ZW4gdGVtYXQsIGN6eSBtb2ds
aWJ5xZtteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRyYXdpYW0K
RXdlbGluYSBLb3Byb3dza2EKU2VuaW9yIEhSIE1hbmFnZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
