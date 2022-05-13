Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457C3C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 May 2022 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L+1XPPGGJgFpxo5VWlGgCo2GLlHs74yDN0tPqFywZ/w=; b=zyHi8Ap6B1ZpYP
	3JsvCFdih4AEy4HFL/5SuHIomeuUsOrBFKaGY+nq/OSF294U43jJwZR/A8N/kGOGWK7xlNhwIUpFc
	iYBuI1LVt/SPW4KfOQwiSJJ+qLfJoWcUPNlxik92m0V95IhS3JB/TdC252Ff1K5Ks/8edTy9gYVSI
	qD5zay/FJlcnl74/MhFBzVxD0llaIMqV1ObcGY7FwX7tsvgKiX7+HZSyKh923q+5QY/0HSHExZg1T
	GExkJcD8E+YYQ6FKTsL8Ba8uuArC8Y6rHXUbPqWBYWy594qy9hru/jIP5XbNV+m92i0Bs1Vaa4SCI
	tRnMZzda4Uv6MgaSG0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npQNp-00Eyra-5B; Fri, 13 May 2022 08:10:45 +0000
Received: from mail.coredeal.pl ([51.75.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npQNg-00Eyor-F1
 for linux-snps-arc@lists.infradead.org; Fri, 13 May 2022 08:10:38 +0000
Received: by mail.coredeal.pl (Postfix, from userid 1002)
 id 77A45A523E; Fri, 13 May 2022 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=coredeal.pl; s=mail;
 t=1652429250; bh=9KGuIG62LgzC9aYmjKxzocuYLRCVghXg6v9Q1q2LHec=;
 h=Date:From:To:Subject:From;
 b=LBdjlMtNGZh6qZSVv6xub7o6u5NfN+LlnDgUtZd3IgbOo13vxDSU6woARWu9ONwp6
 m+kwIHzc9Dfoc/w5ubn+eG2jo5iTI0hpE14iRjk54jWyom8H2dxqB7eD6wFBRbmww0
 Ng6x4PNfekwWAVfzWnf0Y1uFKiRVlVwxGyGE8zNYDpQ760utluNoSnl06sTdH23ZkX
 mdepn3V7o//WUdz9s/j9DoxZzKUlo0+3yjBGoyiSRGAlzOGDE7S422dSagM7uw1kbv
 2AP32556d/4je8AlqoKevxQQ376drGqEIm3wga+LJHIine8aYQxYZy08eI90f7cAuq
 EZNaxcAQw0VoQ==
Received: by mail.coredeal.pl for <linux-snps-arc@lists.infradead.org>;
 Fri, 13 May 2022 08:05:55 GMT
Message-ID: <20220513064500-0.1.33.o0tj.0.jna03om7kj@coredeal.pl>
Date: Fri, 13 May 2022 08:05:55 GMT
From: "Krzysztof Maj" <krzysztof.maj@coredeal.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Biznesowy angielski
X-Mailer: mail.coredeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_011036_719563_394B0748 
X-CRM114-Status: UNSURE (   0.47  )
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
acSZY2VqIHN6Y3plZ8OzxYLDs3cgaSBvcG93aWVkemllxIcgamFrIGR6aWHFgmFteT8gCgoKUG96
ZHJhd2lhbQpLcnp5c3p0b2YgTWFqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
