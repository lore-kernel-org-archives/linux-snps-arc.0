Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307C3C54798
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Mar 2024 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbDjIhSgAInfJ2cTlRTVCWwKdr5X0s5fzLvfP489dGk=; b=Tf0O0yOuoisEDZ
	MWG8b2PA2LhWMeO/VMB/HEP+vLdkNbmm3clHCEnqWSV8V0hEu2oLk4XDYAlXPmIgLE8z7x1IRuRvl
	61w7CVj+4oTm6L8Qamw5ivNWux+nJKezjMNDnDtlopS1ebd8NVqt7Z7qPdg7ceiUKCzoQQwuP6QIs
	8uhPImKTD61tUtv1QX+WtFhAj70/VHPt9ZpswVgZq9Ju7GGJmwo/MGDaKdLqEjuxzHRv4SZav/Laf
	zG7KjvhzbAQrpprp2F7yQ+0fEglQTDcsOw3OJ+GkY1TqJk8tbmxpf7H40qdfwrVOGCOTIYpw7YpV9
	DUjcqYfCI8gZKmHSsrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQCX-0000000CcVh-3gIQ;
	Tue, 05 Mar 2024 08:31:05 +0000
Received: from mail.tradeharmony.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQCT-0000000CcUC-0bZy
	for linux-snps-arc@lists.infradead.org;
	Tue, 05 Mar 2024 08:31:03 +0000
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id BB20D2158E; Tue,  5 Mar 2024 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1709627458;
	bh=niuXEqqR8RnV+jmqddfR0pqtgAFtRJIUEsYODsA2d0w=;
	h=Date:From:To:Subject:From;
	b=aRsJww+IN5jhimE0dtTQ7vnF8uTDVculN4jKhZ7ZmUV84hTzEUP11bPdrdIGxcD+/
	 6RGqUjKYUVZZ/iKZfZdD+k8koQrEXJLTRRC89I1NymNSfYpGBuS/zD4P1aRv7Bpb2s
	 cGXoouA8q0Fb57fvZdW2vjvD9ZH1sRnx6SHC6Jb3A2L772Oszy9/Zm5tRWmP31i9/o
	 gLA0AalKxs0hpVteoitbx62lDPI5TPxquY3BLpS+xnaHSni/5SJnrTU+Sp6z3Wpdhh
	 ITUwfvd/2SJPrbuLEX1SxUJPpcgW7qQHgm/uVfiicBSviLFJiDSxy6Na+MUm+fn1hD
	 P4ouKoFvqSBPw==
Received: by mail.tradeharmony.pl for <linux-snps-arc@lists.infradead.org>; Tue,  5 Mar 2024 08:30:11 GMT
Message-ID: <20240305074500-0.1.4x.1v2n6.0.3nkdqzj95o@tradeharmony.pl>
Date: Tue,  5 Mar 2024 08:30:11 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.tradeharmony.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_003101_627301_81C73ECE 
X-CRM114-Status: UNSURE (   0.99  )
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
amk/IAoKClBvemRyYXdpYW0KS2Fyb2wgTWljaHVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
