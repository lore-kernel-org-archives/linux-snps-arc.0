Return-Path: <SRS0=6MfY=IC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484C7C433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:45:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F2D64E56
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F2D64E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SyIRDsW09X4mdm6QnLA7yrZg9B4ef/6TNXxVE+/IigI=; b=T2kUqtXHcS1spQT5Rw4sgTF8A
	yTFlRsh+MogQyK/hWeze57z1v3+1yTYqEGHUWVYpRrAoOVtJSVzhj6eUgKWl3zDv6aFc9Sx9/fWQP
	ZV3PlPt8tyVKjX9/LC9DYjc1sCva1AR1iy58oGfh6Cam/My/bETl9yeTfq6rbsLpeZztHuCvIWrAa
	FT+gVXuWdlK5IN78yw62YyCYLmPquF3uwclFQF0HFuHFO7T70zsGPoVhFFWCWYIHIID3Dqch3hfGA
	eJddFYVuA2tk06JvANk1W/T/T2HVk7GzTRQwFXu0+5zKQGvi/Q7A/vS5osH7t48vGHU1qis5xiKYE
	ll4J2+21Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHc7g-007DhF-TV; Thu, 04 Mar 2021 00:45:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXIB-006F9S-J0
 for linux-snps-arc@desiato.infradead.org; Wed, 03 Mar 2021 19:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=fjb3lzqJlAPFYD+P9TAKImBOhphMtA6KIkgUGIniQY0=; b=uoAV+Yr2mS2bHoEVjcrE9IhGuF
 7fA2mRY7icL+CBxQohwmxcOVl2KOnAlg7Wz/ovUHP84cNgHTeHc44/Z3812WbWo9Zp4L6Da42q6HO
 yU80dXCT3QCM620xNJKkjVjj07lV8sKEOmGfF06M2F2hF5IMsNgoiOZBuiHuRgJumWcqGR+xXfXCF
 aiY0QA5Grm+hsIPXSnlhiiz8TAm7nWPXnlA+mYEfvuvPjBfjdxmcodlP1m3AJIG4MCq5+eCvbjRPU
 ZQlyvzWcL1kf+KZv3m/c3N1W8316Qe90SH84xgWHzZtL5frNv3+vYMul34LhcLKTn+BcFYITt5D1/
 Fjo3oDzg==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXI4-003wCa-6o
 for linux-snps-arc@lists.infradead.org; Wed, 03 Mar 2021 19:36:14 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C53B04004D;
 Wed,  3 Mar 2021 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1614800153; bh=l3bVaISNWAZzQvMeOl1Vbq1yQomM6IJE9Z3PsJ0Vua8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SWpls9l1bAt2rGVr96Y1RVCew0JcCGGSATV05xR2j6qqnJaBz986bpTstk1Ww/i6q
 C/6ru7dF6YTc3BYx6k0KF2fdHCn4s8HxT/4KdX38JWaqy/YQ1wzgwouy+xSn5LlZmj
 M0mpZ7rH1P+QtVvt8iP1jpDsGFXRtjKW6fqsfJsgmz+I5AniFyS8S4ucBUJjfGtgMU
 4M1IYL4El1QLddP0NBXc+dJPA9tY46Ce5xqa4RZprmdngNBcuRU3bqudklp4iRS/yh
 Ry44JBl4Pq++bMliJpKvxfNiccMmUovou1WLL0Ittt5HtzGSyOfOpcP/JI97Kyqbu4
 1bwN6JNhN8Fcg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 071C4A0063;
 Wed,  3 Mar 2021 19:35:46 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8AE7B8009D;
 Wed,  3 Mar 2021 19:35:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tdf8QV5w";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2+T0p/F+mGxxXfLlmKBU7D2bcTnKYS/ahxlo2pEwWH8MR8ErzH2UCvKnwFqJLCJDBnGmltzeDdcYQZ93sIb6XaRquFNvwBeQpbf4HzrCq/q/t1b/HgdAq7ow5a0IPqxnK4BpZcAtJoWzA383ayAP6hGY1/AUb2yse387lbW+dMHI4SoCHiKswqzCqmqQExx4XE0DdptQv4PBrZtVF7qBPmMOOePDinkTuDgvgBTaZXZDS+HV/+MQh95qqsmFco9kCjZ2WagELiyHUGodGvMpYwq2HYw0YkKOuWX6KvZ2opr5fs4WsVzKPPQsxsC9AOTx4LUBBWT727veX/dmi1F3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjb3lzqJlAPFYD+P9TAKImBOhphMtA6KIkgUGIniQY0=;
 b=LWmi9+m6A0uCNy9hJuKVWMcQqTM3TXBT4aRE9vgfPopacsuVq7jrxF1oayNh6/vJw3P8w0Jgo7fdOU9Q2ixFjCYyfRLjmx7q0zxq+qBQPWZjN+VsVCdgaezCyoMGz1KyKqJx3p7Gg+Fv2JD59uK5dX2p5Q4uyLhagKCB7JzfitO/MhNyLmocTwXrEjcTOZOS0Zof2EJKYdQZ2jVzMzvQezOEcRbMUEPt/VtoSLRMozJrBP9xmTWTfKsoLTfVkQt7WVtH3NG5iQdqITJTcCoQkL4xJ3gxeLKjd9Mp8fbGTYIDrZ7GTXeVxNzwRYiQDpjyogdIa7iQFffJWAAgeQxqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjb3lzqJlAPFYD+P9TAKImBOhphMtA6KIkgUGIniQY0=;
 b=tdf8QV5wbGF6WOnk1i61ePe4gqKBRt/HjVbjGlocBhLGh/jqWBlIXwlsvJg80oVzSZf2WY7sGdLyIDjV2lyVf5zirh57AfpwPEVi3SwniQf/wTi10IhFmaJbpHFmPFqg1j+SgEzBXVuJI1gxfphWDPh/RFlWTPJFeYaBrGZdtUY=
Received: from BN8PR12MB3330.namprd12.prod.outlook.com (2603:10b6:408:43::15)
 by BN6PR1201MB2513.namprd12.prod.outlook.com (2603:10b6:404:ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 3 Mar
 2021 19:35:39 +0000
Received: from BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::e9a7:42ea:687f:1393]) by BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::e9a7:42ea:687f:1393%6]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 19:35:39 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Helmut Grohne <helmut@subdivi.de>
CC: Guillem Jover <guillem@debian.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "980963@bugs.debian.org" <980963@bugs.debian.org>
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Thread-Topic: Bug#980963: dpkg: Please add ARC architecture
Thread-Index: AQHW/L0p4qdbh/AU1k6vjN0gzHQfS6pytd0AgAAZF98=
Date: Wed, 3 Mar 2021 19:35:39 +0000
Message-ID: <BN8PR12MB3330A43C8C7E626A24813DF2A1989@BN8PR12MB3330.namprd12.prod.outlook.com>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <BN8PR12MB333028A46C2A7A80690DDB76A1B19@BN8PR12MB3330.namprd12.prod.outlook.com>,
 <YD/PtMrNdGYmBY3/@alf.mars>
In-Reply-To: <YD/PtMrNdGYmBY3/@alf.mars>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: subdivi.de; dkim=none (message not signed)
 header.d=none;subdivi.de; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d0685a2-eaac-473a-fc7b-08d8de7b86bd
x-ms-traffictypediagnostic: BN6PR1201MB2513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1201MB2513D8D0DFEB3E867B984E8FA1989@BN6PR1201MB2513.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PEJVUGN8+8PnrQtjv8tpJh9klD1RAc8C1Bi7MpDrwSmsxRLyhs4jf9bBL580+nMuv+xz9pF4U4HVD56i7/oQ2s6i+J6EvnH6DLDlzVx0CV/JqepF/Fi4jBH+Ic/X648luw94i4j4p6LBskqS/tVAyNHTn22PPlqeL3ccw5QqUhoMRCfgO7okxhqvrMwOb892ofBypnJBu6wWFJrBj/vxUSmrW4GvozUlK/WFwJwLybF+JQwxY6zD4TTGe6YYq7PCXWc5joyuUGQY0Yj8jpp2at7eP4Mq14sekZ3dp0Y5K0r9iWVz5Apa8mdHXkNON9nV9Yj543gcFMMNV2nIJKENgLbh90F3Q2CPiWDZ2yBQp4eWZRKwqZ2Otq5wxNIQE5YvNmCPR6OJpbAuU7jUoUQkrJIyNzuF8+yA/7+h0Pfb/hrqCQHX88wjDdx1+7iJDnVvceE5/xSTEMpOIxPHtEwMzaAT9XmuFuI1Tv/yLT8o/jpcj7Dc6nEkk4/sajBk+edRUAiede/orvMy5cr46qDX/A0cYfxkEp0CMWc2fbL+oV+BRI4XzRzkLNnCfDQJOjRgZkgDgSCi7U+ha0fNi019VRbVLaFb7RQ2zhfOrG9q60o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3330.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(396003)(376002)(136003)(8936002)(26005)(6916009)(5660300002)(6506007)(186003)(91956017)(76116006)(83380400001)(966005)(71200400001)(52536014)(66446008)(66476007)(66556008)(64756008)(9686003)(478600001)(8676002)(66946007)(4326008)(55016002)(2906002)(316002)(54906003)(86362001)(33656002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?kD0XQeO/O11qwJ1nUPt1YGjaye+BgYqbMNoeBl7qx5M3YNToCE6NDdzHt+?=
 =?iso-8859-1?Q?SlEFtuZxFnA8HQzFyVLe/RhstSvF3TUT+akyrPkP2kNfCi6m9l70Zp1AOH?=
 =?iso-8859-1?Q?LK3ykoTXHi28pvFn9K7lgSTiJ7Xw9hNHIZ+mdBdNBJvDs8hSTrCubsgzJv?=
 =?iso-8859-1?Q?V9f6HMZ25z8cOZ/ZvufTFentFrQEGLVx5nGGA3HW4xJTyP+lbpxQXAk+s4?=
 =?iso-8859-1?Q?pBLOhjzNOS/OjDGHbH7y/xDqvfhCkt24wR5YJKp5CoDXM26oNuBAy5IRvn?=
 =?iso-8859-1?Q?wOGnGtSuvqhtT8/NRdUnER5olOqsnJ9lryZXs0KV/jSm5QXl33n0lddFRC?=
 =?iso-8859-1?Q?O8tXiGXCFqYy8F8prAZbCJiIXdN1SrVXSBurLT2FTu/ip6oJ0/b6rBIna6?=
 =?iso-8859-1?Q?MMXobYgDl1LzCSsRw5QMn1DU+wQU/MgduJTZa9f7dxBfOeZlfwQ7JIL2mN?=
 =?iso-8859-1?Q?3vudCpGp4Tv2shYPKQjxeJDK4AueKGI/Ry38gnVVuYIGdDiPfowdNxJiZ+?=
 =?iso-8859-1?Q?ovW5MqNQe1Y93QeCuJSPI5tBk1vjOdP0lhDECUKivgAjn6vnzffKNW9Dvc?=
 =?iso-8859-1?Q?RyVbMxvzNN3wvzTT6gZxdr1njXOspZY93Xvdo3TUFmNisIlZhjVB25pwfD?=
 =?iso-8859-1?Q?modDFkZd2eVJsc+jqB2m/AtlctA2x6iy9Anfuzm7dZ3PjHiBPfA6wommsm?=
 =?iso-8859-1?Q?Q0eURdEnu0eyp6G4RxwN7foxNmcc03AKbBmXCrEQmRbRIQAbKZBxzf5/nW?=
 =?iso-8859-1?Q?dYrjx2NpGLhT5GXP3ZyhpxPdgYGi62LHtRNI1WOomUEswJ1Y1Eo26udKri?=
 =?iso-8859-1?Q?hBgN+F2efm0M3WiO2CFpoYvIAo2TRLjODUMe3ieytYshOfRnyurjTWyq3L?=
 =?iso-8859-1?Q?rLuTN8vj4DcCqbhqv7Knii39w4QBo+arUi4boTBKXW8+QTExc9GFnk+2Fr?=
 =?iso-8859-1?Q?wJYbytpX7YqkQ9LN5AmdxhLbyGdcLFP7p9Y1ca4JTRzQ+tx/wqlA5z1//1?=
 =?iso-8859-1?Q?ZPnOLGQ1bSFwS1D4XrC6nUnNcmbWGjfJ7hQlM/4wOEkPC+Qto25e5rghZN?=
 =?iso-8859-1?Q?o88untpVuNVXkulJfflH5pCGM89FSDesLd73l4eDGulToFEFWs8HlEvaCG?=
 =?iso-8859-1?Q?gzvBgLyDvFY/XhxLLVRG8EOOc715rXDNvmqvAalsBgGsJbcTyRPz2WdHFY?=
 =?iso-8859-1?Q?Z9BDivHMGkxVTZdNLfYeO9ezvZ6iJIueOMhWnmv64PrlRO2wrTGOAs5ZED?=
 =?iso-8859-1?Q?rn8lcc5urfrWtE22c3g3rNbHipM8qZ0Nh41dpkW1ZhZY5ch9ajqzYugWIs?=
 =?iso-8859-1?Q?8QqFHigXl1Iy7OYsv0uCetjabW3cPDHqUfSXjtx9KakHxHjOHeXNoIKTsS?=
 =?iso-8859-1?Q?tO8p1BrXMy?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3330.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0685a2-eaac-473a-fc7b-08d8de7b86bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 19:35:39.4597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXzp/ghvFUfd7gtNUm/K4U1od1WrusRu/iMmwPBVddDy2iRfB7O/UpM6kon84d32zz9CyDHx0VHeJ2o03ntHwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_193614_115181_242B519F 
X-CRM114-Status: GOOD (  13.01  )
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

Hi Helmut,

> On Sat, Feb 06, 2021 at 07:25:35PM +0000, Alexey Brodkin wrote:
> > Any chances to get updates on this one some time soon?
> 
> No. The triplet cannot be changed once added. Therefore, the addition is
> often deferred. The absence of the triplet can easily be worked around.
> A bootstrap can be prototyped already. A major missing piece though is
> glibc 2.32 being packaged in Debian. That likely is a prerequisite for
> resolving this bug.

Well not sure why there's a dependency on glibc as w/o ARC target support
in dpkg nothing could be built for ARC. For example I did built Binutils
with fixed dpkg.

> Things that often need architecture-specific support for a new
> architecture include:
>  * guile-X.Y (cross support)
>  * libgc

Above 2 are not [yet] supported but seems to be easy ones.

>  * libxcrypt (symbols)

Not sure about "libxcrypt" (whatver that means), but libgpg-error supports ARC since 2018, see:
https://github.com/gpg/libgpg-error/commit/48c8f8ddfc80551db7615e1eb3555c1dc3f6a657

>  * nspr

Done in 2019, see https://hg.mozilla.org/projects/nspr/rev/cc73b6c7dab2e8053533e1f2c0c23dc721e10b76

>  * openssl (packaging)

Not sure what needs to be done here as I know we build a lot of complex
things with OpenEmbedded/Yocto and openssl libs are being built for sure.

> Are any of these fixed or confirmed working for arc?

See above, quite some do work.
 
-Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
