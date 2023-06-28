Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC0EB64DA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Jun 2023 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=bZ0kjkWJX1w6pq
	MNVoILz9r5xAaiPpF2o1LOMsm6UOAl+wgiANU9d9ZYVKDtaJd0w7xxtNvJSYZq9fl9H5wXI1xI/ZS
	MdXUZL3CQuH+p7f/IJgqJf/HUzOK6fRdCJtn6MGh/GT6aofhh3kS5gx3IU2xsQEcPNCWXv9k5tf1e
	PI647U9EvT46xT4ViKP9Oda4CtKCbb6y9yZyBC2Zh0KQkFBfWJOe1AFJPOyE4unWws+2ychjshRBG
	DQKENJIAaPfLL3EASWBvmzkymtPe1S68IiyEfEqJy9v/pnB6DF8rrNs8FKQTAG6q3HSTINR/Z8vaD
	Y8YFlZJ97zpocygXje4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEQ0L-00F6EO-2p;
	Wed, 28 Jun 2023 07:54:22 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEQ0J-00F6Cd-0Z
	for linux-snps-arc@lists.infradead.org;
	Wed, 28 Jun 2023 07:54:20 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id BEB49884EE; Wed, 28 Jun 2023 08:52:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1687938760; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=SjcfiFeFb2GLUDUZM7Yh8W0pxpKNuj4cPBJMASXQc/Bb9kEn9425TFNxbnPGpS6Hg
	 rDPh8xs5rfOEPJpKyQrq94dwrauEPVQJTCHys+PblL82uNl1hwS/aRntTcJnWuT94R
	 0FjT2jhnBVhtIBmfJem1TJYFk7pjIb5otL1XG5+3a0TnZ9dvDWX0pOZQt2DiZijYME
	 p30rvnyAOh956e6ZkBdc9+mvKekuaW4U0aPxlmCuyzDRLiBz7oHcD6m5JO767FnnWL
	 5TuAwDfwS2n3uNiI7vn5useMeLBmrGy2+dvHFxmcyGjdgxpOAK8PALl6P2/AAwoOAj
	 HG3kp4xwzQ/0A==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Wed, 28 Jun 2023 07:50:51 GMT
Message-ID: <20230628074502-0.1.6x.2sifu.0.oihbk3grgc@lokoho.com>
Date: Wed, 28 Jun 2023 07:50:51 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_005419_358464_78B9B9CD 
X-CRM114-Status: UNSURE (   1.56  )
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
