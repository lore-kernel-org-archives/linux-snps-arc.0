Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E407EC6FD18
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Apr 2023 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S8/Fq1p9ILVghgfv9vHOgx98fkBp/IHwENiNUwxwf58=; b=FYlepxCMNgb9aL
	xV+8VA8m9r+nbpePmRnQLCdmW/I+XI9vnCOvmUzRzoIvBbzpbehbkqLSgy7ssssdp4YHYOO+Xp9fz
	jf8f7rlEqqUV+PzdWGq5yfXvMfpj2qUll5a0x1aW8BDlJD76WC6lskmydkmzfFownkt6JwU4Xi/z7
	NsPQSthNI52jh1se2qEXvSydOL6Ic3XgHjoUJa1p3yoW8BrUA0lSezPiEmZ2hy/HH65zBStnPMHcj
	2UGA8ukgrewfHIKsv+YLSkZZjkZQLtAMd4nozXoSodGv4y1YhcKdVhJ2t9JirTcnH3ZX7Ohj3Lgh1
	3BzvdsYpwij3UhPe/onw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDJj-000PFZ-2J;
	Tue, 25 Apr 2023 07:42:27 +0000
Received: from mail.camacfoy.pl ([195.231.80.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDJg-000PF1-1P
	for linux-snps-arc@lists.infradead.org;
	Tue, 25 Apr 2023 07:42:25 +0000
Received: by mail.camacfoy.pl (Postfix, from userid 1001)
	id 7B58CA452B; Tue, 25 Apr 2023 08:31:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=camacfoy.pl; s=mail;
	t=1682407963; bh=0DnDcjJl846YrSvLcp0W7cMkWp4Lfhp/OZAq4oBoaY8=;
	h=Date:From:To:Subject:From;
	b=d0BhB9DYAnR6Z1b/h62mw1H5gzEzAE1i8MU0gKBgVqNpSEeaLj6POs4NBTV57WiLG
	 GmJJ/fKE7t8+Ke7j6YZ+VfYz166tIqlDQVRgTH1+eT0sjqCPsSUPcOM/e/HacRPBbH
	 o8M4s9pNEdaeJOCYR5NW7+LVOZR43jERQJZBQxpftOu6yw/Um8d1ezr2QurCnvXIqP
	 XFXaha7MpMirNJSfJcKC3uN4v6QbXJQBkpdsnX92QpmvuH2cca1eFD0A0lgdgroNVm
	 FzI7ZF9kmFQImaLvBGQ0cwMLQzCDBZ3i7TDBTJ93TFiTG/qiB7AsrQ+Dw6qj1TnRr7
	 LedTbsbWBAt5w==
Received: by mail.camacfoy.pl for <linux-snps-arc@lists.infradead.org>; Tue, 25 Apr 2023 07:30:57 GMT
Message-ID: <20230425074502-0.1.83.bz43.0.b8zf2iyirj@camacfoy.pl>
Date: Tue, 25 Apr 2023 07:30:57 GMT
From: "Krzysztof Maj" <krzysztof.maj@camacfoy.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: biznesowy angielski 
X-Mailer: mail.camacfoy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_004224_646562_80A6BF4E 
X-CRM114-Status: UNSURE (   1.37  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIHJvenfDs2oga3dhbGlmaWth
Y2ppIGrEmXp5a293eWNoIHN3b2ljaCBwcmFjb3duaWvDs3c/CgpPcHJhY293YWxpxZtteSBrdXJz
eSBqxJl6eWtvd2UgZGxhIHLDs8W8bnljaCBicmFuxbwsIHcga3TDs3J5Y2gga29uY2VudHJ1amVt
eSBzacSZIG5hIHBvZG5pZXNpZW5pdSBwb3ppb211IHPFgm93bmljdHdhIGkgamFrb8WbY2kga29t
dW5pa2Fjamkgd3lrb3J6eXN0dWrEhWMgYXV0b3Jza8SFIG1ldG9kxJksIHN0d29yem9uxIUgc3Bl
Y2phbG5pZSBkbGEgd3ltYWdhasSFY2VnbyBiaXpuZXN1LiAKCk5pZXN0YW5kYXJkb3d5IGt1cnMg
b24tbGluZSwgZG9wYXNvd2FueSBkbyBwcm9maWx1IGZpcm15IGkgb2JzemFyw7N3IMWbd2lhZGN6
b255Y2ggdXPFgnVnLCB3IHN6eWJraW0gY3phc2llIHByenluaWVzaWUgZWZla3R5LCBrdMOzcmUg
endpxJlrc3rEhSBrb21mb3J0IGkgamFrb8WbxIcgcHJhY3ksIHJvendpamFqxIVjIG1vxbxsaXdv
xZtjaSBiaXpuZXNvd2UuIAoKWmRhbG5lIHN6a29sZW5pZSBqxJl6eWtvd2UgdG8gbS5pbi4gemFq
xJljaWEgeiBuYXRpdmUgc3BlYWtlcmFtaSwga3TDs3JlIHcgc3p5YmtpbSBjemFzaWUgbmF1Y3rE
hSBwcmFjb3duaWvDs3cgcm96bWF3aWHEhyB6YSBwb21vY8SFIGphc25lZ28gaSB6d2nEmXrFgmVn
byBqxJl6eWthIEJ1c2luZXNzIEVuZ2xpc2guCgpDenkgbcOzZ8WCYnltIHByemVkc3Rhd2nEhyB3
acSZY2VqIHN6Y3plZ8OzxYLDs3cgaSBvcG93aWVkemllxIcgamFrIGR6aWHFgmFteT8KCgpQb3pk
cmF3aWFtCktyenlzenRvZiBNYWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtc25wcy1hcmMK
