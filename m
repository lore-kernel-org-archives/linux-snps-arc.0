Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CD6EB64D9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Jul 2023 08:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=Ay5Vv+tqA7mkiZ
	NCMIHw6/ihrz5byHA30Jupy5it2K7UpwlC45q0Mi+UYOpiNJHgvU5vpZ0B01kzQn0HCO7ynbMeFKs
	fybZZ4rws6uKp5Q6usLmnVmmObyIk7W6F+3T80GdIPUZiWrel1hVRfs4a3TLv+iIDvcaWUIOYpz5Q
	qwJhAFQRsONtM39UK0DMjaN/MnCb6Qw+cr6T5kLznKsmYGem0R6SPEstb8cdsPP0OGr/eUtAnqsuZ
	2ALNY0cgacnH3UEhYAZa64oVjpmGYmn+n/5/yEI3AacH6woNRvNwvrEIY2G1Cb/5mLYylY3g2quG0
	FLsktKtJdaOqgzT76F8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUvB-00Gs0l-2V;
	Wed, 12 Jul 2023 08:10:01 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUv8-00Grzy-2s
	for linux-snps-arc@lists.infradead.org;
	Wed, 12 Jul 2023 08:10:00 +0000
Received: by mail.lokoho.com (Postfix, from userid 1002)
	id 855AC88741; Wed, 12 Jul 2023 10:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1689149239; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=vK5BzqdTbiE2uBCtMbv2/hyt5dkGs+AMAadI3s4Rfjy9aovVp1usM5/EMh5xJ4Uzo
	 34iJeN5N1XKR5vJ688SPhc6me5NPzLZTl4zH5YrTp6aieOlYb/CbxYXNYOKUocUGXw
	 zh/UpOs+zolGguX7589xO6HQWWNfA60uVWUkn7qd0Cof+lvVG42MGA7gmZn+0jyusI
	 WnT/eb6g49BQwzmJtqQOmiuFozRX3ZZppNtVHha0TpJd6QncS57UJg9ppge7chFKD5
	 9xcgyiNBie9S5vQF+zb06QToZTxtixj0+loBel5t33pxIH+lVFAJSiw9Qz+k1jJXN6
	 Z3xb7cXX2B4eA==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Wed, 12 Jul 2023 08:05:10 GMT
Message-ID: <20230712084501-0.1.9.2jvx.0.hv9btnwrkn@lokoho.com>
Date: Wed, 12 Jul 2023 08:05:10 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_010959_069288_0D3C66FE 
X-CRM114-Status: UNSURE (   0.46  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
