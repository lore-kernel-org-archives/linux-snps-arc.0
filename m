Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79129C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jun 2022 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O0XFtcxQ+vmtBygIUxrKVIClcOMVPuTfzIB7jcepIHQ=; b=Ddvsok9d/r7JnZ
	90Z76MXpbw+b2FckWApXjHs8pdPjdSjkYxdy+ge7n5HFiVfbmimAs5wR/LRp26o8FwTKgQMdhbWHj
	1wM78Br5CCim/Q6SkfrJ9hpSHCXtdK9S3LnHPO8n388cN2znd06EL2telv5soXjNW/dnm/cVDJ19F
	CJ4k4iyLGdjSUiqNVHYZrnAIKPNlIXZVBiOVpfs83vCm+z0EXNOwDeGVN4/P8YM8LiX2zgmjRduQ3
	2Zqn+QAit6tjPXrHVKRkPxBHMFxeiDbr6zKpZQyKqTwEtgZPROf8AO7y+NLsJukfm5wYU6OoFuddn
	Tg8FHauiuGUwdiM4TVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzeld-008NxO-Ew; Fri, 10 Jun 2022 13:33:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzela-008Nwm-Gn
	for linux-snps-arc@lists.infradead.org; Fri, 10 Jun 2022 13:33:36 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E5DAEC0420;
	Fri, 10 Jun 2022 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1654868013; bh=NVIy1wXXGPpgBRUC2gTecZysVWNhBGrOuufnzOnPDp4=;
	h=From:To:CC:Subject:Date:From;
	b=aeQ/Hpe5MHiDupMdSsLddezTkmArZdjvLptZJuAbqus9kv+JuKSYgL7SUQzP75I5f
	 3dSVj2M68IyijbTjDyJiapxndpj9LIirE4xL5RW+UQhmE/dRji8eo3q3FW+qsV/iSJ
	 3Y0cdRbBoNGc1OFuRYyr+FkB8gmPYKBnfyzuYbgWIL1AS0/RDlO+lurQyNxlujAGRL
	 kmhSCzkbTuBL7D0IopbBAOTHkOSoqb2fmJP0POIQO+00SOpQYWnQqePdW3l6f8E8Kg
	 8wkhz365mVmvmUBy4xwUkbp2JwM7DM81zJmIxtkE3CM+cvf6SEox8TWy0R+BjiOydu
	 L9IzHlOyZ+4Sw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BCB3EA0065;
	Fri, 10 Jun 2022 13:33:33 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 99CAE40086;
	Fri, 10 Jun 2022 13:33:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="f0zRHymG";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLJpFKzmNEV1LZS05vTIqc3YdVqXq83bcFLsgNErdxcTXIozwXvHUUYRrKCl/+JshmOQmAoYHFem/wqh4zbJj7PuUvebENI/QNuDP/2+wISdOz6y5C6DcmaiR/wIGSEI8uMJU3m3xXleqgSWGjltJQQwVVX6f76ANYvvZH/ZYKErMKJ+PDoRaXb2aqUOenOPYxaSR5s83SkTIcTWYs1FvHPfKath+CahC+7IaKpUctuyL+ucjYXUnVXOuCo2YO11oip0qJevgMGkIPfjnH9H0r6ZpnvL5xN9VkzE60qEhm1I8l7Dg+qkFKm1yiT8n38T0Al3ImI6YA4H/K8UHrJdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVIy1wXXGPpgBRUC2gTecZysVWNhBGrOuufnzOnPDp4=;
 b=YkvX3TckG77OzaJI+X82LI3GzRgZzYaqk66AjsVz0dLy8Qzy5ixzR8XmjNlgfFJZ0+Ts/sImvDoYldU55nMum8Jz1U7Hb8Jt+kfmmDu7UPot5Wggq3OGGUT6EXjL4KL8hRqh60dR8glhjIVF9F9pPos6FeUf1kIdeeF96PGPXkB0OSqBi6SUX8mR1Plmu8VOc2SOJ/Sdido67N2v7QRoARb0q2TseV2QhXdKCFytLQ5RrtsHoUA6H2Ol2HEWEU5pcunIjR1S5MKtpymyT7bwYzWTCBdOdnk5n/2c6NJ4H5/fDnXWgfmpnfjn9YmkS3CWl0OE0CnTlj3OOvdg+lWykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVIy1wXXGPpgBRUC2gTecZysVWNhBGrOuufnzOnPDp4=;
 b=f0zRHymGXjhSw/ojWrmTkyzSjGT99fzzz/rHh0bV+gl/mF/T4CDiYU0+JCSGTrsIRQxoSyMNVlORmRUHoyB9iGOlzPlovy5YQPdRqKXfT6QodZQbrojcFvof1y3tfEgBIxq4t9Z4n5dViTQ4/pBXcMFVtotPZxxcpJOn+2NFsEo=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by DM5PR12MB1321.namprd12.prod.outlook.com (2603:10b6:3:78::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 10 Jun
 2022 13:33:31 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::1175:61f1:71e9:2038%6]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 13:33:31 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Topic: [PATCH] package/bpftool: add a patch to fix cross compilation
Thread-Index: AQHYfM6sRE33fFkIREGzvMCEBX5New==
Date: Fri, 10 Jun 2022 13:33:31 +0000
Message-ID: <48ac54a1-f946-8f98-42e4-e39d2ab7130d@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e319835-03bc-423e-b81b-08da4ae5cf39
x-ms-traffictypediagnostic: DM5PR12MB1321:EE_
x-microsoft-antispam-prvs:  <DM5PR12MB1321B59EA8E06B175B42F476A6A69@DM5PR12MB1321.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  V8S+zlu5H33TjAayhU7ny41/yWWVckwtEM1BJlA0rZUt0SIcZE7W+BUa6L/DrFCJfBVKRPwYfEVNcN0NT8K/S3CiQHjC/Y9q8WN9COalhFCjBUClUVNl/TRQmbEkxL9xbUe/uNwOykM0ANMDMJ78S5zdu+PhytfMtU5g2ySjdjhImOBE8T7fTpx5ZGAmNP0rpiz6CN9O/FtUzrxr/9D0+PZ0izAAyi0u0PNKCIp9n5BVlsUA7dcoOS0IGdTEvnXhf9S5aIx/07XHWqhLvE9VZeIT/zunlLbte4TxmYVJe9i/Hgex0pQRR0pMPGUeywTN92+8Sw+Omuq/qyl5+Xxya04ayapbrojuq/hDbq1/ipzVNak1v5j7RK3J2aEugyArjdYbVjm9FFNNNFMCTZYpQI0TBBZ3mRUbo5D5Bm74FMKpvOBiDj3qBRaJd/4hWYSJs5XeDshU4PdtbRKtBmwMAKbMvCT9jNS7DE6rbeOZQ0x80SJIEoSeP6Fn+2s+GPy0XmYB6eZ3lv6vDGp7O52o4iX/IESWM+j1C1FJMXmV8tZjVqQJGyIrkqouXqviwY180QhWUpPZRC+cZutvpcLPxDCJQ/aP7pTd5VjlzaUyoR8BvYqjgm8NCfN1J7hIKQXPMkcju0IezINnQ4LmFEH6r31i6SDraZVqUb9DdmtWqgohP95P2DI8tp6l/5TokNObHDdi7p9kGdZ8MztdWXk7jeCM3CSEMVRh5L4sRJ5CjLGllcg6K1cQ58ZRZk9K7bvyi7VWou/g9Z7LgsmKglCJnH+PbP9PSiPCmrb6SVL6800PwjrufThRjJqLcPC9V4gj28BU5a7/ZDM2h3oJXe+buQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66446008)(91956017)(31686004)(86362001)(38070700005)(122000001)(4326008)(6486002)(508600001)(8936002)(186003)(71200400001)(8676002)(38100700002)(6916009)(5660300002)(316002)(66476007)(26005)(76116006)(36756003)(66556008)(2906002)(31696002)(966005)(6506007)(6512007)(64756008)(2616005)(66946007)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ditnVHREeUV6MFpoZXR6TlhuOGJvTk1BUjR1RHdsZGFMRUlmbXE5OHZ6Sitl?=
 =?utf-8?B?dmREdnJHVkQyME5vZGFaMVZHQXN0MUZKZXJ4ZXVFaVBGcFEzckVRRHlzUXE1?=
 =?utf-8?B?K1hNeWVneWo2VjVRTGlQdWJML1dqa1NOQWVVYXlJSmwyTk9OL05zSnZEaytr?=
 =?utf-8?B?bjRqMDd3OUdDWjF2cjZhRFdKUDlWSER6RkR0SnpSSnRZQ2tJdFNpOVhteEdx?=
 =?utf-8?B?RmNLQ0QzZXIxTGdicFRKRm9zMDF1MVlRcW41bzRMalVUNFdBUzlpaDhtRkFP?=
 =?utf-8?B?OCtPMjJKUTREZUtjbmRtb3lEYzhub0VzNUo2SHhFaDVWZmVmcUJpRk1JdDBj?=
 =?utf-8?B?QmNockVWT0JyeHZEQmFRRzZldFg5ZEpTTi9jSDRsdFdhQUtrYkx2eWNJakZ4?=
 =?utf-8?B?bGMxRlJoY3k3Unk1WU5jNzY0VjN6VXZUWjF5R2gwV2VpdlpjWWNZZWxMOWZP?=
 =?utf-8?B?ZXFIV3djZHBSd1N0K3hjWUVuaDRGd2RNODQ1UisrcDF2WUg2QUFhQ3IzY3Jq?=
 =?utf-8?B?NGlDWHVDc292UjZ3bnFFYS9wY1NiWjdUU0QwdUk1V1JaWnoybFVwaENBQnNR?=
 =?utf-8?B?Rk1jVXlBd3krakNuUzlZTUxobGVXK3dwM3FXYW9FeHE1d2xYTmVYRDgxbzRX?=
 =?utf-8?B?WHllMjgyajlEd1NGYndaYUZXa2Y2NDMwZ3BKZDMycFc1UmoxRnZzY0dsNE50?=
 =?utf-8?B?K3Z2cjRFODhiL3g2U1pIb1puaVM3QjdYa3R0Tk1jM3JCUjdkMzNsTEpXejZE?=
 =?utf-8?B?UHVoOWE3OVNSVVRtOTdUQ2h0dEtmZm9XR0VianR5YkZOeEQ3aVhVTWNaNVVv?=
 =?utf-8?B?OEFSTnJtcjJ0Tm1STmxkNzl5TU9BMEJURFpoL0puVWtzWmtCVGNzenl2OVlC?=
 =?utf-8?B?MEdRaG5HSmNzTlpKWVdLUVNHdUpVbUR4YXdUWnAveS9VUGVpWkxWUVNOSFRO?=
 =?utf-8?B?ckNEdGVESDE2OFppTENsd1lsUStESzRRS1BoRUtYSHhCTlBzSEkyTHhSbmgy?=
 =?utf-8?B?V1RNMXI2R0VNSU5Jb2lTU2VVRmgwK2JkZUxDZXE4NUEyRWhkQlI1RzdraTQv?=
 =?utf-8?B?MTJFd2FWQnE2M040L0FVRmxFdjNEYkRNOVBodTZkeTczcEwxRFdOeFQ0WGZk?=
 =?utf-8?B?WVZQZldZdWswV3lSSjRoVnZTVkRvaFNlRTUvck5lS2F2cGRBTDZGZVUxazRJ?=
 =?utf-8?B?YVNvb2dNcnNDYTBwN0pSb0hnMWhGM2FKSEJEaTIxeDd2a3R6QmliQklKeWl1?=
 =?utf-8?B?d2JvTkhhbUFjT2krbythYjBBZGlQekx6VDhNdXpLL2ZoU3ZNNDFEU0tCN0Mw?=
 =?utf-8?B?TnBUZkRTYXZ6SitkUHhhVDNEYWpEZC8rQnR1QUNKeERpOGZvUHBBeGs1Rkpu?=
 =?utf-8?B?d0pSUnpkZnpabjlLVkFkeFRzUkE1a3JFalo4enh6cUNZMzMwbjg1Z2pFbWZQ?=
 =?utf-8?B?cnZmOHZtS1VjVUhXVVNPVCtkRjBlOTBlek01N2JoM21QaXBIc29UVUpYT3hZ?=
 =?utf-8?B?akRWODdPU2ZKdmlsQ1FWTmhiTEx2enRvZ1ozSUdvVjJ1NHNKUHJNQTRsNnN1?=
 =?utf-8?B?d2prSVV4clNMd2plL0puU0tleUVPR0lnLzZpTFl1QWVnbTZScFRsY2xmUHk2?=
 =?utf-8?B?a3F4VkxLSXlESlo2TUR3YkRLa2pXSDltU3VYYm1nM1BUMjNMbTNwTnNuZGIx?=
 =?utf-8?B?Q2ljUEFUVEI5MEdEK0pjeTdYSzFjaFpzRDNoSnprYVVhYjlpNG1IN0VJcTFG?=
 =?utf-8?B?dFNScThZZnVjYnYxNmRLZGRxM2svQ2JQYzBUVHJPTTdyb2ZRSUhOMmQ2RnBn?=
 =?utf-8?B?UTFwMXc5MHRhQWttMVlES1dKeUlLbWJoN0xXbG9QUUpudDI2TmNWOUpKTzBS?=
 =?utf-8?B?SDlxQnhTUUU5bnhWU0REM0FJc1c2QXVVZXRNb2FBSGNINE5DUFZmQld4eUZF?=
 =?utf-8?B?aGw2bzByN1dNUXp5V282SUJqeGpFclFDQ2gxM3Z3UlVDTnZQZDRoUjNHbnNr?=
 =?utf-8?B?a0t3aHVFLzlFL0d3enRDNFdETW1mQ0FIUDd2ak9FWnZUdDQ0anVMK1kvdlpH?=
 =?utf-8?B?ZEwybmpaMUJva1F1dnN4bU4zR1VKNTMzclBDeUFpeTdBRGRwUVd1akxRbEdy?=
 =?utf-8?B?Skp3TGc1bVMzSTNhaFNQZ29YWEhneHg4ODZZai8xVlVucmlwc24vWThwdU9L?=
 =?utf-8?B?cmVheTZwemlEdWlUTUVNeGpMV003cU44d2JWeTRhNDlSdG5TRVZ4MWxtQTZu?=
 =?utf-8?B?L3hwcS9oOHJwVFgyc2VtUEUvTFlvWjdHcGVKNWhyTWxkZ3MvOGJTR0lQdW5w?=
 =?utf-8?B?dmRYRlNRaWZ0NHFyNFlDK0dLUjZLbHhLSDg1Szk5MndaVHBKOWhOdz09?=
Content-ID: <42C8A7AB53E504408720AFD4BCA79A3D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e319835-03bc-423e-b81b-08da4ae5cf39
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 13:33:31.0822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4melWPiS8skynn6P3llCq96CCiMdGL35fCwvDZzWeeFWs3vpaeFEmN4m2IMKddlTrR7RDU2xaKLR0a22xSItQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_063334_661351_76AE3486 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

If on the host machine the "co-re" is supported, bpftool will
build a bootstrap version of itself as well. In that case, the
cross compilation can fail. This commit adds a patch to remedy
that. The fix that you see here is already upsteamed [1].

[1]
https://lore.kernel.org/bpf/165477661272.11342.13015777410417612477.git-patchwork-notify@kernel.org/T/#t

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 package/bpftool/0001-fix-bootsrap.patch | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/bpftool/0001-fix-bootsrap.patch

diff --git a/package/bpftool/0001-fix-bootsrap.patch b/package/bpftool/0001-fix-bootsrap.patch
new file mode 100644
index 0000000000..03f4231cca
--- /dev/null
+++ b/package/bpftool/0001-fix-bootsrap.patch
@@ -0,0 +1,32 @@
+This is an adapted version of an upstreamed patch [1], else it won't be
+possible to cross compile bpftool if "clang-bpf-co-re" feature is enabled.
+
+[1] bpftool: Fix bootstrapping during a cross compilation
+https://lore.kernel.org/bpf/8d297f0c-cfd0-ef6f-3970-6dddb3d9a87a@synopsys.com/t/#u
+--- bpftool-v6.8.0/src/Makefile
++++ bpftool-v6.8.0/src/Makefile
+@@ -51,7 +51,7 @@
+ $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT)
+ 	$(Q)$(MAKE) -C $(BPF_DIR) OBJDIR=$(patsubst %/,%,$(LIBBPF_BOOTSTRAP_OUTPUT)) \
+ 		PREFIX=$(LIBBPF_BOOTSTRAP_DESTDIR:/=) \
+-		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
++		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) AR=$(HOSTAR) $@ install_headers
+ 
+ $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS): $(LIBBPF_BOOTSTRAP_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_BOOTSTRAP_HDRS_DIR)
+ 	$(call QUIET_INSTALL, $@)
+--- bpftool-v6.8.0/src/Makefile.include
++++ bpftool-v6.8.0/src/Makefile.include
+@@ -12,11 +12,13 @@
+ ifneq ($(LLVM),)
+   $(if $(findstring default,$(origin CC)),$(eval CC := clang$(LLVM_VERSION)))
+   $(if $(findstring default,$(origin LD)),$(eval LD := ld.lld$(LLVM_VERSION)))
++  HOSTAR ?= llvm-ar
+   HOSTCC ?= clang
+   HOSTLD ?= ld.lld
+ else
+   $(if $(findstring default,$(origin CC)),$(eval CC = $(CROSS_COMPILE)$(CC)))
+   $(if $(findstring default,$(origin LD)),$(eval LD = $(CROSS_COMPILE)$(LD)))
++  HOSTAR ?= ar
+   HOSTCC ?= gcc
+   HOSTLD ?= ld
+ endif

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
